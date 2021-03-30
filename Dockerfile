FROM golang:1.16-buster
MAINTAINER Guenter Bailey <office@bailey-solution.com>

RUN apt update && \
	apt install -y git && \
	git clone https://github.com/digineo/3cx_exporter.git /3cx_exporter && \
	rm -r /var/lib/apt/lists/*

workdir /3cx_exporter
RUN go build && \
	cp 3cx_exporter /usr/bin/ && \
	touch config.json

CMD ["3cx_exporter", "-config", "config.json"]

