FROM ruby:2.6.3
ENV LANG=C.UTF-8\
    LANGUAGE=C.UTF-8\
    LC_ALL=C.UTF-8\
    TZ=America/Sao_Paulo
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
VOLUME /gems
VOLUME /cnab_parser

WORKDIR /cnab_parser/app

# Add a script to be executed every time the container starts.
#COPY entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["/cnab_parser/entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["bundle", "exec","rackup", "-o", "0.0.0.0","-p", "3000"]


