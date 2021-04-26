# teste container ubuntu
docker run --rm --name=ubuntu-container --network pfa -dit ubuntu bash && \ 
    echo "iniciando ubuntu para testes." && \ 
    echo "iniciando ubuntu para testes.." && \ 
    echo "iniciando ubuntu para testes..." && \ 
    apt-get update && \ 
    apt-get install iputils-ping -y && \ 
    apt-get install iputils-curl -y    