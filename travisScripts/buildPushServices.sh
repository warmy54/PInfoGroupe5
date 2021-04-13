#!/bin/bash

# construit les images des différents services
docker image build -t servicefilm -f services/serviceFilm/Dockerfile .
docker image build -t servicegroupe -f services/serviceGroupe/Dockerfile .
docker image build -t serviceuser -f services/serviceUser/Dockerfile .

# connection au docker hub
echo ${DockerPassword} | docker login --username ${DockerUsername} --password-stdin

# change les noms des images et les envoies au docker hub
docker tag servicefilm khptif/servicefilm:latest
docker tag servicegroupe khptif/servicegroupe:latest
docker tag serviceuser khptif/serviceuser:latest

docker push khptif/servicefilm:latest
docker push khptif/servicegroupe:latest
docker push khptif/serviceuser:latest