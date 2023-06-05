# create mynet
docker network create mynet

# create vol
docker volume create myvol

#deploy volume in network mynet
docker run -d \
    -v myvol:/var/lib/mysql \
    --network mynet \
    --name mydb \
    stackupiss/northwind-db:v1

# create application
# run inside mynet, connect to mydb
# set environment variables DB_HOST, DB_USER, DB_PASSWORD

docker run -d -p 8000:3000 \
    --network mynet \
    --name myapp \
    -e DB_HOST=mydb \
    -e DB_USER=root \
    -e DB_PASSWORD=changeit \
    stackupiss/northwind-app:v1



    
