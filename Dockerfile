
FROM lmenezes/cerebro:0.8.4


COPY application.conf /opt/cerebro/conf/application.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/opt/cerebro/bin/cerebro"]
