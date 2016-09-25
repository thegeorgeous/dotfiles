# aliases
alias docker-ehq="COMPOSE_HTTP_TIMEOUT=10000 docker-compose up"
alias drmid="docker rmi $(docker images --filter "dangling=true" -q --no-trunc)"
alias drmae='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias drmv="docker volume rm $(docker volume ls -q -f 'dangling=true')"
alias docker-bash="docker exec -it ehq_v2.unicorn_1 /bin/bash"
