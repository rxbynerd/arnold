FROM ruby:3.2.2
LABEL maintainer="luke@ghostworks.io"

RUN gem install bundler -v '~> 2'
RUN bundle config set deployment 'true'

ENV ARNOLD_CONTAINERIZED 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN bundle binstubs --all

COPY . .

CMD ['/usr/src/app/bin/arnold']
