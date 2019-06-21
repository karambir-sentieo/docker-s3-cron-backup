FROM alpine:latest

RUN \
	mkdir -p /aws && \
	apk -Uuv add groff less python py-pip && \
	pip install awscli && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*

COPY entrypoint.sh dobackup.sh /
RUN chmod +x /entrypoint.sh /dobackup.sh


ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
