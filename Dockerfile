FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y bc mbpoll mosquitto-clients


COPY getaddress.sh /
COPY execute.sh /

ENTRYPOINT ["/execute.sh"]
