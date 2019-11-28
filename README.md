# Foundry VTT docker
A docker image for Foundry VTT made to be compatible with Pterodactyl.
This is the first docker image I made from scratch so most things will probably be done badly, any improvements are much appreciated!

To run this in docker: docker run -it -d -e URL={url} -p 30000:30000 --name foundry k1ll3rm/foundry-vtt
replacing {url} with the url tot he Foundry VTT .zip file for linux

To keep the data between containers you can add -v /path/to/folder:/home/container
