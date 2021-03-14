FROM python:3-alpine
RUN apk add gcc musl-dev --no-cache \
	&& pip install streamlink \
	&& apk del gcc musl-dev --no-cache \
	&& rm -Rf /tmp/*
ENV STREAMLINK_PORT
EXPOSE $STREAMLINK_PORT
ENTRYPOINT ["streamlink", \
	"--player-external-http", \
	"--player-external-http-port", $STREAMLINK_PORT \
]
