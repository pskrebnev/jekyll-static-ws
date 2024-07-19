# Dockerfile
FROM jekyll/jekyll:latest

WORKDIR /srv/jekyll

# Copy the Gemfile and Gemfile.lock to install dependencies
COPY Gemfile* ./

# Install any needed packages specified in Gemfile

RUN gem update --system
RUN gem install bundler

RUN bundle install

# Copy the rest of the application code
COPY . .

CMD ["jekyll", "serve", "--host", "0.0.0.0"]

