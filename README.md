# oxidized
- https-portal
- ipv6 support

## usage
0. set up for docker-ipv6
1. make `router.db`
```
mkdir oxidized/source
echo "sw01;10.0.0.1;ios;group1;user;password;diffie-hellman-group1-sha1;enablepassword" > ./oxidized/source/router.db
```
2. deploy
```
make up
```

If you don't need reverse-proxy and IPv6, change files and just `docker-compose up`.
- docker-compose.yml
    ```
      services:
          oxidized:
              ...
    +         ports:
    +             80:8888
          ...
    -     https-portal:
    -     ...
    - networks
    -     ...
      volumes:
          oxidized-output:
    ```
