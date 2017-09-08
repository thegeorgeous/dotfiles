ehq=~/src/btt/ehq
part=~/src/btt/ehq/participation

ehqv2=ehq_v2.puma_1
reporting=ehq_reporting.unicorn_1
db=ehq_db_1

phq(){
   COMPOSE_HTTP_TIMEOUT=10000 docker-compose -f docker-compose.yml -f modportal/docker-compose.yml $1;
}
