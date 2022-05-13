FROM dart:stable

RUN apt update

WORKDIR /myapp
COPY . .
RUN dart pub get
RUN dart pub get --offline

EXPOSE 3000

CMD ["dart", "pub", "get"]
