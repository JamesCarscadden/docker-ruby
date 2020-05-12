FROM ruby:2.7-buster
LABEL maintainer="James Carscadden <james@carscadden.org>"

# Add more up to date Node, Postgres and Yarn sources
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
&& echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/postgres.list \
&& curl -sL https://postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
&& apt-get update && apt-get install -y \
    nodejs \
    yarn \
    postgresql-server-dev-12 \
    postgresql-client-12 \
    build-essential \
    chrpath \
    libssl-dev \
    libxft-dev \
    libfreetype6 \
    libfreetype6-dev \
    libfontconfig1 \
    libfontconfig1-dev \
    && rm -rf /var/lib/apt/lists/*

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
