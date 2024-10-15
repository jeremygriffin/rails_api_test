###
# base image
###

FROM ruby AS base

WORKDIR /usr/src/app
ENV PATH=/usr/src/app/bin:$PATH

# RUN bundle config --global frozen 1

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ENTRYPOINT ["/usr/src/app/bin/docker-entrypoint"]

EXPOSE 3000
# CMD ["/usr/bin/bash"]
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
