ehq=~/src/btt/ehq
part=~/src/btt/ehq/participation

ehqv2=ehq_v2.puma_1
reporting=ehq_reporting.puma_1
db=ehq_db_1

phq(){
    COMPOSE_HTTP_TIMEOUT=10000 docker-compose -f docker-compose.yml -f modportal/docker-compose.yml $1;
}

ehq(){
    COMPOSE_HTTP_TIMEOUT=10000 docker-compose -f docker-compose.yml $1;
}

repo_maintain() {
  cd ~/src/btt/ehq
  git_maintain

  cd ~/src/btt/ehq/participation
  git_maintain

  cd ~/src/btt/ehq/reporting
  git_maintain

  cd ~/src/btt/ehq/bonfire
  git_maintain

  cd ~/src/btt/ehq
}
