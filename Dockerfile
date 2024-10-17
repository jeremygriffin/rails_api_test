###
# base image
###

FROM ruby:3.3.5 AS base

WORKDIR /usr/src/app
ENV PATH=/usr/src/app/bin:$PATH

#COPY docker/CloudflareCerts/Cloudflare_CA.crt /usr/local/share/ca-certificates/.
#COPY docker/CloudflareCerts/Cloudflare_CA.pem /usr/local/share/ca-certificates/.
# per docs: https://developers.cloudflare.com/cloudflare-one/connections/connect-devices/warp/user-side-certificates/install-cloudflare-cert/#download-the-cloudflare-root-certificate
COPY docker/CloudflareCerts/Cloudflare_CA.pem /usr/local/share/ca-certificates/Cloudflare_CA.crt
RUN update-ca-certificates

# RUN bundle config --global frozen 1

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ENTRYPOINT ["/usr/src/app/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
#CMD ["/usr/bin/bash"]
