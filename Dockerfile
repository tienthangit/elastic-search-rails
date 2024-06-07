FROM ruby:3.1.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

# Add a script to be executed every time the container starts.
COPY docker-entrypoint /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["./bin/rails", "server"]