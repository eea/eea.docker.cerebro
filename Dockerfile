FROM lmenezes/cerebro:0.9.4 as source

FROM eclipse-temurin:11-jre-focal

ENV CEREBRO_VERSION=0.9.4

COPY --from=source /opt/cerebro /opt/cerebro

RUN addgroup -gid 1000 cerebro \
 && adduser -q --system --no-create-home --disabled-login -gid 1000 -uid 1000 cerebro \
 && chown -R root:root /opt/cerebro \
 && chown -R cerebro:cerebro /opt/cerebro/logs \
 && chown cerebro:cerebro /opt/cerebro

WORKDIR /opt/cerebro

COPY application.conf /opt/cerebro/conf/application.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chown cerebro:cerebro /opt/cerebro/conf/application.conf


EXPOSE 9000

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/opt/cerebro/bin/cerebro"]
