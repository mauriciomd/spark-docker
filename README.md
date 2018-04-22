# Spark with Docker

A ubuntu based Apache Spark container. This script deploy a spark in a standalone cluster.
To default, the compose file create a master and two workers. However, compose file can be extend to add others workers.

Finally, this script was based on example available on "Running Apache Spark standalone cluster on Docker".



## Docker Compose Example
To create a simple cluster using [docker-compose](http://docs.docker.com/compose):
    
    docker-compose up
    
