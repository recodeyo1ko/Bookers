FROM ruby:3.1.2

RUN gem install rails -v 6.1.4

WORKDIR /usr/src
RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh \
    && bash nodesource_setup.sh \
    && apt-get update \
    && apt-get install -y nodejs imagemagick zlib1g-dev libpng-dev libjpeg-dev \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

COPY . /usr/src
WORKDIR /usr/src/bookers
RUN bundle install
COPY . .

RUN rm -f tmp/pids/server.pid

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]