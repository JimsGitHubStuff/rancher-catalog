version: '2'
services:
  dockercraft:
    image: gaetan/dockercraft
    tty: true
    labels:
      io.rancher.container.hostname_override: container_name
    ports:
      - "25565:25565"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock