# docker-ruby-2.4

This is a docker container suitable as a starting point for use as a Ruby container (most likely for Rails projects).

This environment contains Postgres 9.6 development libraries and client apps, NodeJs, Yarn, Bundler and Ruby 2.4.

This is build off of the official ruby:2.4-stretch container

To Use

```bash
docker pull jamescarscadden/ruby-2.4
```

Create a Dockerfile in the root of your Rails project and use this container as a base. That is:

```docker
FROM jamescarscadden/ruby-2.4
```
