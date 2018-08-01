version: '2'
services:
  dockercraft:
    image: gaetan/dockercraft
    labels:
      io.rancher.scheduler.affinity:container_label_soft_ne: io.rancher.stack_service.name=$${stack_name}/$${service_name}
      io.rancher.container.hostname_override: container_name
      raefik.frontend.rule: Host:dockercraft.teampirate.io
      traefik.port: 25565
    volumes:
      - /vare/run/docker.sock:/var/run/docker.sock