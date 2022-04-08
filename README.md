# SeeFT-API

## Features

## Requirement
`production`
- dart
- docker

`dev`
- mysqldef
but run `./scripts/script.sh`


## Installation

``` fish
$ docker compose build
$ docker comopose up -d
$ ./scripts/script.sh
$ ./sql/migrate.sh
$ docker compose run --rm server dart ./sql/sql.dart seed
```

## Usage

``` fish
$ docker compose up
```

## Note
### .shスクリプトが動かない場合

```
$ chmod u+x ./scripts/script.sh
$ chmod u+x ./sql/migrate.sh
```

### docker-compose upでAPIが経たない時

```
$ docker compose run --rm server dart pub get
```

## Author
NUTMEG（技大祭実行委員会情報局）
mail: nutfes.info [at] gmail
