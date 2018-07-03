ehq=~/src/btt/ehq
part=~/src/btt/ehq/participation

ehqv2=ehq_v2.puma_1
reporting=ehq_reporting.puma_1
db=ehq_db_1
webpack=webpack.dev_1

phq(){
    COMPOSE_HTTP_TIMEOUT=10000 docker-compose -f docker-compose.yml -f modportal/docker-compose.yml $1;
}

ehq_update() {
  echo 'updating EHQ repo'
  cd ~/src/btt/ehq
  git_maintain

  echo 'updating v2 repo'
  cd ~/src/btt/ehq/participation
  git_maintain

  echo 'updating reporting repo'
  cd ~/src/btt/ehq/reporting
  git_maintain

  echo 'updating bonfire repo'
  cd ~/src/btt/ehq/bonfire
  git_maintain

  echo 'switching to liberal branch'
  cd ~/src/btt/ehq
  git checkout dev-liberalization
  git pull origin master
}
