FROM ruby:2.7.1
LABEL maintainer="luke@ghostworks.io"

RUN gem install bundler -v '2.1.4'
RUN bundle config set deployment 'true'

ENV ARNOLD_CONTAINERIZED 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ['/usr/src/app/bin/arnold']
