FROM node:8.9-stretch

RUN cat /etc/os-release
RUN node -v
RUN php -v
ENTRYPOINT ["/bin/bash"]
