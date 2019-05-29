FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
VOLUME /gems
VOLUME /cnab_parser

WORKDIR /cnab_parser

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["bundle", "exec", "ruby", "app.rb" ]


