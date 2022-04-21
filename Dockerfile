#syntax=docker/dockerfile:1

FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

#Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]

RUN chmod +x /opt/program/rails

# syntax=docker/dockerfile:1
#FROM ruby:2.5
#RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client
#WORKDIR /myapp
#COPY Gemfile /myapp/Gemfile
#COPY Gemfile.lock /myapp/Gemfile.lock
#RUN bundle install

#RUN chmod +x docker-entrypoint.sh

# Add a script to be executed every time the container starts.
#COPY entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]
#EXPOSE 3000 *\

# Configure the main process to run when running the image
#CMD ["rails", "server", "-b", "0.0.0.0"]
