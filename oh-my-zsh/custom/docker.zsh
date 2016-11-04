# aliases
alias dcup="COMPOSE_HTTP_TIMEOUT=10000 docker-compose up"
alias drmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias drmc='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias drmv='docker volume rm $(docker volume ls -q -f "dangling=true")'
alias dbash="docker exec -it ehq_v2.unicorn_1 /bin/bash"
alias dconsole="docker exec -it ehq_v2.unicorn_1 bundle exec rails c"
alias ddb="docker exec -it ehq_db_1 mysql"
alias dcbuild="docker-compose build"
alias ddevlog="docker exec -it ehq_v2.unicorn_1 tail -f log/development.log"
alias dclog="COMPOSE_HTTP_TIMEOUT=10000 docker-compose logs -f"
alias dcrestart="docker-compose restart"
alias dcs="docker-compose stop"
alias dexit="docker exec -it"
