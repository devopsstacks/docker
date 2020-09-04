# Base Image
FROM debian:10

RUN cat /etc/os-release
#RUN node -v
RUN apt-get update -y
RUN apt-get install -y php7.2
RUN php -v
ENTRYPOINT ["/bin/bash"]
