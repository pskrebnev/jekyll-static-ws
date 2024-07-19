# Create a Jekyll container from a Ruby Alpine image
# At a min use Ruby 2.5 or later
FROM ruby:2.7-alpine3.16

# Add Jekyll dependencies to Alpine
RUN apk update
RUN apk add --no-cache build-base gcc cmake git

# Update the Ruby bundler and install Jekyll
RUN gem install rubygems-update -v 3.3.25
RUN update_rubygems

RUN gem update --system
RUN gem install bundler
# RUN bundle install
RUN gem install jekyll

# Copy the project files into the container
WORKDIR /app
COPY . /app

