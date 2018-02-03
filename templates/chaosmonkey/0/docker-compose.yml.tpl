version: '2'
services:
  chaosmonkey:
    image: mlafeldt/simianarmy
    labels:
      io.rancher.scheduler.affinity:container_label_soft_ne: io.rancher.stack_service.name=$${stack_name}/$${service_name}
      io.rancher.container.hostname_override: container_name
      io.rancher.container.network: true
    environment:
      IAM_ROLE: ${IAM_ROLE}
      SIMIANARMY_CALENDAR_ISMONKEYTIME: true
      SIMIANARMY_CHAOS_ASG_ENABLED: true
      SIMIANARMY_CHAOS_ASGTAG_KEY: ${ASG_TAG}
      SIMIANARMY_CHAOS_ASGTAG_VALUE: true
      SIMIANARMY_CHAOS_LEASHED: ${DRY_RUN}
      {{- if eq .Values.CHAOS_PROBABILITY "always"}}
      SIMIANARMY_CHAOS_ASG_PROBABILITY: 6.0
      {{- end}}
      {{- if eq .Values.CHAOS_PROBABILITY "daily"}}
      SIMIANARMY_CHAOS_ASG_PROBABILITY: 1.0
      {{- end}}
      {{- if eq .Values.CHAOS_PROBABILITY "weekly"}}
      SIMIANARMY_CHAOS_ASG_PROBABILITY: 0.2
      {{- end}}
      {{- if (.Values.MAX_TERMINATIONS)}}
      SIMIANARMY_CHAOS_ASG_MAXTERMINATIONSPERDAY: ${MAX_TERMINATION_NUMBER}
      {{- end}}