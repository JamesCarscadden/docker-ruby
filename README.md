# docker-ruby-2.3

This is a docker container suitable as a starting point for use as a Ruby container (most likely for Rails projects).

This environment contains Postgres 9.6 development libraries and client apps, NodeJs, Bower, Bundler and Ruby 2.3.

Forked from vsts-deploy-rails

To Use

```
docker pull jamescarscadden/ruby-2.3
```

Create a Dockerfile in the root of your Rails project and use this container as a base. That is:

```
FROM jamescarscadden/ruby-2.3
```

