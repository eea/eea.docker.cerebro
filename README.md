## Description
Docker image to run cerebro [Elasticsearch 5.x and Elasticsearch 6.x](https://www.elastic.co/products/elasticsearch) web admin tool that replaces [Kopf](https://github.com/lmenezes/elasticsearch-kopf).

Cerebro project: https://github.com/lmenezes/cerebro

It connects to ES client that has basic authorization enabled.

## Usage
To run the image:
`docker run -d -p 9000:9000 --name cerebro -e CER_ES_URL=http://es-client:9200  -e CER_ES_USER=rwuser  -e CER_ES_PASSWORD=rwpassword eeacms/cerebro`

Then you can access the web console in this URL: http://[Docker_Host]:9000 and connect to Elasticsearch cluster.

You can mount volumes for the configuration folder and / the logs, for example:

`docker run -d -p 9000:9000 --name cerebro -v /mount_folder/logs:/opt/cerebro/logs  -e CER_ES_URL=http://es-client:9200  -e CER_ES_USER=rwuser  -e CER_ES_PASSWORD=rwpassword   eeacms/cerebro`


