FROM lmenezes/cerebro:0.9.2

COPY application.conf /opt/cerebro/conf/application.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/opt/cerebro/bin/cerebro"]
