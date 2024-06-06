# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Commands
- Install ElasticSearch

docker run \
  -p 127.0.0.1:9200:9200 \
  -p 127.0.0.1:9300:9300 \
  -e "discovery.type=single-node" \
  docker.elastic.co/elasticsearch/elasticsearch:7.16.2

# Project Elasticsearch
Reference:
- 1: https://www.honeybadger.io/blog/rails-elasticsearch/
- 2: https://viblo.asia/p/tich-hop-elastic-search-trong-ung-dung-rails-6BAMYk3Pvnjz