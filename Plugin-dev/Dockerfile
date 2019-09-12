FROM debian-stretch

RUN cat /etc/os-release
RUN apt-get update -y
RUN apt-get install -y php
RUN node -v
RUN php -v
ENTRYPOINT ["/bin/bash"]
