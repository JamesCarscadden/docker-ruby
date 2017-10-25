FROM ruby:2.4-stretch
LABEL maintainer="James Carscadden <james@carscadden.org>"

# Add more up to date Node sources
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
# Add more up to date Postgres sources
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/postgres.list
RUN curl -sL https://postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
# Add Yarn sources
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y \
    nodejs \
    yarn \
    postgresql-server-dev-9.6 \
    postgresql-client-9.6 \
    build-essential \
    chrpath \
    libssl-dev \
    libxft-dev \
    libfreetype6 \
    libfreetype6-dev \
    libfontconfig1 \
    libfontconfig1-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PhantomJS
RUN curl -sLO https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN mv phantomjs-2.1.1-linux-x86_64 /usr/local/share/
RUN ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
