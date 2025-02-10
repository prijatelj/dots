# Notre Dame proxy for Zotero
To use the Notre Dame proxy with the Zotero extension,

In the Zotero Extension goto Proxies > Configured Proxies

1. Click the '+' symbol
2. Write in Login URL Scheme:
`https://login.proxy.library.nd.edu/login?qurl=%u`
3. Write in Proxied URL Scheme:
`%h.proxy.library.nd.edu/%p`
4. Checkmark Automatically associate new hosts
5. Checkmark Automatically convert between dots and hyphens in proxied hostnames

Each time used, you will be queried to sign in via NetID to use this proxy.
