## Stellar Bitcoin  

### The simplest and cleanest Docker image for running bitcoin

Build and run:
```
docker-compose build
docker-compose up -d
```

Defaults to testnet.

Creates a folder 'stellar' in your home folder.  Everything is stored there, delete it to reset.

Edit docker-compose.yml for mainnet

Pull requests welcome!

// test rpc
curl --user user:password --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getblockcount", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:18332/

### Donations
If you like the code, a donation would be appreciated. Even a single XLM!

Click here for the [`donation page`](https://stellarkit.io/#/donate). Nano support!

```
XLM: GCYQSB3UQDSISB5LKAL2OEVLAYJNIR7LFVYDNKRMLWQKDCBX4PU3Z6JP
```
