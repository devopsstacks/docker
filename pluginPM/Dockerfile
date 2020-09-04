# Base Image
FROM node:8.9-stretch

RUN cat /etc/os-release
RUN node -v
RUN apt-get update -y
RUN apt-get install -y php7.2
RUN php -v
ENTRYPOINT ["/bin/bash"]
