###
# base image
###

FROM ruby AS base

WORKDIR /usr/src/app
ENV PATH=/usr/src/app/bin:$PATH

#RUN bundle config --global frozen 1

#COPY Gemfile Gemilfe.lock ./
#RUN bundle install

#COPY . .

EXPOSE 3000
CMD ["/usr/bin/bash"]
#CMD ["rails", "server", "-b", "0.0.0.0"]
