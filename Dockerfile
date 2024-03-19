FROM ubuntu:20.04

ARG EZ_VERSION=0.0.4
WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt-get update && \
    apt-get install -y tzdata mysql-server openjdk-11-jdk unzip && \
    rm -rf /var/lib/apt/lists/*
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

RUN  update-rc.d mysql defaults  && service mysql start && \
    mysql -e "CREATE SCHEMA ezyplatform DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;" && \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345678';"

ADD https://ezyplatform.com/api/v1/platforms/${EZ_VERSION}/download ezyplatform.zip
RUN unzip ezyplatform.zip
WORKDIR /app/ezyplatform


COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

EXPOSE 9090 8080 3005 2208 2812/udp
