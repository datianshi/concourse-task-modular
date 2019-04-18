#This is for our platform automation
FROM datianshi/platformautomation
MAINTAINER sding@pivotal.io

RUN apt-get update
RUN apt-get install -y jq
