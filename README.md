docker-pocketmine
====================

This is Docker image for a PocketMine-MP server.

# Pull PocketMine-MP

Download submodified Pociketmine-MP source

```
git submodule update --init --recursive
```

# Build docker image

Create a Docker image

```
sudo docker build -t docker-pocketmine .
```

Run a container
--------------------

Launch container

```
sudo docker run -d -it -p 19132:19132/tcp -p 19132:19132/udp --name docker-pocketmine -v $(pwd)/PocketMine-MP:/data docker-pocketmine
```

Setup wizard
--------------------

Start the setup wizard.
When setup is completed, please end with `ctrl + c`.

```
sudo docker exec -ti docker-pocketmine ./start.sh -p /usr/bin/php
```


