cd docker-postgresql
docker build -t bbertka/postgresql:latest .
cd ..
mkdir docker-cache
docker save bbertka/postgresql | gzip -c > docker-cache/bbertka-postgresql.tgz
cd service-broker
mvn clean package -Dmaven.test.skip=true
cd ..
tile build --docker-cache ./docker-cache
pcf import product/*.pivotal
