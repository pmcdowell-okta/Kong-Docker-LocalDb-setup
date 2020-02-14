FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y curl npm wget vim build-essential python-setuptools python-dev git make ssh zip

#Install Kong
RUN apt-get install -y apt-transport-https curl lsb-core
RUN echo "deb https://kong.bintray.com/kong-deb `lsb_release -sc` main" | tee -a /etc/apt/sources.list
RUN curl -o bintray.key https://bintray.com/user/downloadSubjectPublicKey?username=bintray
RUN apt-key add bintray.key
RUN apt-get update
RUN apt-get install -y kong
#Done install Kong

RUN rm -rf /var/lib/apt/lists/*

#setup Kong #########

RUN kong config init
RUN echo "Kong config file for local database\n" > /etc/kong/kong.conf
RUN echo "database = off\n" > /etc/kong/kong.conf
RUN echo "declarative_config = /kong.yml\n" >> /etc/kong/kong.conf
RUN kong start

#test Kong
#curl -i http://localhost:8001/


