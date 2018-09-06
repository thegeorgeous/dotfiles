ehq=~/src/btt/ehq
part=~/src/btt/ehq/participation

ehqv2=ehq_v2.unicorn_1
reporting=ehq_reporting.puma_1
db=ehq_db_1
webpack=webpack.dev_1

phq(){
    COMPOSE_HTTP_TIMEOUT=10000 docker-compose -f docker-compose.yml -f modportal/docker-compose.yml $1;
}

ehq_update() {
  echo '******************************updating EHQ repo***********************************************\n'
  cd ~/src/btt/ehq
  git_maintain

  echo '***************************updating participation repo****************************************\n'
  cd ~/src/btt/ehq/participation
  git_maintain

  echo '*****************************updating reporting repo******************************************\n'
  cd ~/src/btt/ehq/reporting
  git_maintain

  echo '******************************updating bonfire repo*******************************************\n'
  cd ~/src/btt/ehq/bonfire
  git_maintain

  echo '***************************switching to liberal branch****************************************\n'
  cd ~/src/btt/ehq
  git checkout dev-liberalization
  git pull origin master
}
