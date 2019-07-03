# docker-ruby

This is a docker container suitable as a starting point for use as a Ruby container (most likely for Rails projects).

This environment contains Postgres 11 (Postgres 9 on ARM) development libraries and client apps, NodeJs 12, Yarn, Bundler and Ruby 2.6.

This is build off of the official ruby:2.6-stretch container

To Use

```bash
docker pull jamescarscadden/ruby
```

Create a Dockerfile in the root of your Rails project and use this container as a base. That is:

```docker
FROM jamescarscadden/ruby
```
