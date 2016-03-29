# vsts-deploy-rails

This is a docker container suitable as a starting point for use as a Ruby on Rails production deployment container.

To Use

```
docker pull jamescarscadden/vsts-deploy-rails
```

Create a Dockerfile in the root of your Rails project and use this container as a base. That is:

```
FROM jamescarscadden/vsts-deploy-rails
```

