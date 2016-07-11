#FROM ruby:2.2.5-alpine
FROM ruby:2.2.5

#RUN apk update && apk add git alpine-sdk linux-headers mariadb-dev postgresql-dev
RUN apt-get update && apt-get install -y git build-essential mysql-client postgresql-client nodejs


RUN gem install bundler

RUN mkdir -p /opt/signonotron2
RUN git clone https://github.com/alphagov/signonotron2.git /opt/signonotron2

WORKDIR /opt/signonotron2
RUN bundle install

CMD ["script/rails", "s", "-b", "0.0.0.0"]
