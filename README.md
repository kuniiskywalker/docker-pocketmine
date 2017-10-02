# pull PocketMine-MP
```
git submodule update --init --recursive
```

# build
```
sudo docker build -t docker-pocketmine .
```

# run
```
sudo docker run -d -it -p 19132:19132/tcp -p 19132:19132/udp --name docker-pocketmine -v $(pwd)/PocketMine-MP:/data docker-pocketmine
```

# setup wizard

```
sudo docker exec -ti docker-pocketmine ./start.sh -p /usr/bin/php
```
When setupt is completed then exit from container with `ctrl + c`


