FROM lmenezes/cerebro:0.9.0

COPY application.conf /opt/cerebro/conf/application.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/opt/cerebro/bin/cerebro"]
