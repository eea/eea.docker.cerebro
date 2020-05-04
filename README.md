## Description
Docker image to run cerebro [Elasticsearch 5.x and Elasticsearch 6.x](https://www.elastic.co/products/elasticsearch) web admin tool that replaces [Kopf](https://github.com/lmenezes/elasticsearch-kopf).

Cerebro project: https://github.com/lmenezes/cerebro

It connects to ES client that has basic authorization enabled.

## Environment variables

* `CEREBRO_SECRET` - cerebro secret, used for cookies, for example you can run `pwgen  -y 64  | head -n 1` for production
* `CEREBRO_PORT` - cerebro port, default 9000
* `BASIC_AUTH_USER` - cerebro user
* `BASIC_AUTH_PWD` - cerebro password
* `ELASTIC_URL` - elasticsearch url ( for example `http://es-client:9200` )
* `ELASTIC_USER` - elasticsearch user
* `ELASTIC_PASSWORD` - elasticsearch password
* `JAVA_OPTS` - java options

## Usage
To run the image:
`docker run -d -p 9000:9000 --name cerebro -e CEREBRO_SECRET=secret -e BASIC_AUTH_USER=admin -e BASIC_AUTH_PWD=admin -e ELASTIC_URL=http://es-client:9200 -e CEREBRO_PORT=9000 -e ELASTIC_USER=rwuser  -e ELASTIC_PASSWORD=rwpassword eeacms/cerebro`

Then you can access the web console in this URL: http://[Docker_Host]:9000 and connect to Elasticsearch cluster.

You can mount volumes for the configuration folder and / the logs, for example:

`docker run -d -p 9000:9000 --name cerebro -v /mount_folder/logs:/opt/cerebro/logs -e CEREBRO_SECRET=secret -e BASIC_AUTH_USER=admin -e BASIC_AUTH_PWD=admin -e ELASTIC_URL=http://es-client:9200 -e CEREBRO_PORT=9000 -e ELASTIC_USER=rwuser  -e ELASTIC_PASSWORD=rwpassword eeacms/cerebro`

