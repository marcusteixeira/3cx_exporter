FROM golang:1.16-buster
MAINTAINER Guenter Bailey <office@bailey-solution.com>

ENV CONFIGFILE=/3cx_exporter/config.json
ENV LISTEN=:9523

RUN apt update && \
	apt install -y git && \
	git clone https://github.com/digineo/3cx_exporter.git /3cx_exporter && \
	rm -r /var/lib/apt/lists/*

workdir /3cx_exporter
RUN go build && \
	touch config.json

CMD ["3cx_exporter", "-config", "${CONFIGFILE}", "-listen", "${LISTEN}"]

