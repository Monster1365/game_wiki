FROM ruby:3.2

WORKDIR /srv/jekyll

COPY Gemfile ./

RUN gem install bundler -v 4.0.20

RUN bundle config set path /usr/local/bundle

RUN bundle install

COPY . .

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--watch", "--force_polling", "--drafts", "--host", "0.0.0.0"]