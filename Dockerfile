
FROM eclipse-temurin:11-jre-focal



ENV CEREBRO_VERSION=0.9.4

RUN  mkdir -p /opt/cerebro/logs \
 && wget -qO- https://github.com/lmenezes/cerebro/releases/download/v${CEREBRO_VERSION}/cerebro-${CEREBRO_VERSION}.tgz \
  | tar xzv --strip-components 1 -C /opt/cerebro \
 && sed -i '/<appender-ref ref="FILE"\/>/d' /opt/cerebro/conf/logback.xml


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
