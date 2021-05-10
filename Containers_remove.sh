#!/usr/bin/env bash

case "${1}" in

    all)
        echo "[=>  ] Fazendo a limpeza de tudo..."
        echo "[==>] Containers..."
        docker rm $(docker ps -aq) -f
        echo "[===> ] Imagens..."
        docker rmi $(docker images --filter=label=fcpfa --quiet) -f
        echo "[====] Concluída a limpeza"        
    ;;
    
    force)
        echo "[=>  ] Fazendo a limpeza de tudo..."
        echo "[==>] Containers..."
        docker rm $(docker ps -aq) -f
        echo "[===> ] Imagens..."
        docker rmi $(docker images --quiet) -f
        echo "[====] Concluída a limpeza"        
    ;;

    i)
        echo "Removendo as imagens..." 
        docker rmi $(docker images --filter=label=fcpfa --quiet) -f
    ;;

    *)
        echo "(Default) Removendo containers..."
        docker rm $(docker ps -aq) -f
    ;;
esac



