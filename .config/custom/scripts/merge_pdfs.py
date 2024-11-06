# Script for merging pdfs from the given order into a single one with
# bookmarks for the start of each file. Optionall concat.
# Depends upon pdftk, grep, awk, & python 3.11 (whenever walrus op :=
# introduced. Grep & awk could be replaced with python regex.

import os
import subprocess

output_file = 'merged_output.pdf'
bookmark_file = 'tmp_bkmrks.info'

start_cat = 1
end_cat = 'r1' #None

files = []
pg_counts = []
bookmarks = []
with open('combine_books.txt') as openf:
    while line := openf.readline():
        file = line.rstrip()
        files.append(file)
        if start_cat:
            data = subprocess.run([f"pdftk {file} dump_data"]))
            pg_counts.append(subprocess.run([f"echo {data} | grep NumberOfPages | awk '{print $2}'"]))
            bookmarks.append(subprocess.run([f"echo {data} | grep Bookmark"]))

# TODO Create bookmarks for the pdfs

# Bookmarks example in pdftk format
# BookmarkBegin
# BookmarkTitle: str
# BookmarkLevel: int
# BookmarkPageNumber: int

# For all bookmarks of existing pdfs,
#   - append a beginning bookmark
#   - increase the page number of all existing bookmarks.
#   - increase the level of all existing bookmarks.

bookmark_info = ''
page_inc = 0
for i, file in enumerate(files):
    init_bookmark = (
        'BookmarkBegin'
        f'BookmarkTitle: {os.path.splitext(os.path.split(file)[-1])[0]}'
        'BookmarkLevel: 1'
        f'BookmarkPageNumber: {page_inc + 1}'
    )

    if page_inc > 0:
        bookmark_info += f'\n{init_bookmark}'
        bookmarks[i] =
    else:
        bookmark_info += f'{init_bookmark}'

    bookmark_info += bookmarks[i]
    page_inc += pg_counts[i]

# Then merge them into one pdftk bookmarks info file

# Merge the src pdfs
# TODO seems I have to do this *per* file . . .
result = subprocess.run([f'pdftk {files} cat {start_cat}-{end_cat} output {output_file}'])

# Update Merged result with the bookmarks
result = subprocess.run(['pdftk {output_file} update_info {bookmark_file} output {output_file}'])
