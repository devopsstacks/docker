# Base Image
FROM debian:10

RUN cat /etc/os-release
#RUN node -v
RUN apt-get update -y
RUN apt install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https
RUN wget https://packages.sury.org/php/apt.gpg
RUN apt-key add apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.list
RUN apt update -y
RUN apt-get install -y php7.2
RUN php -v
ENTRYPOINT ["/bin/bash"]
