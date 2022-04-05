# SeeFT

# Features

# Requiremnt
- make
- Docker

# Installation
```
$ make build
$ make vendor
$ make exec
# cd migration
# go run migration.go up
# cd ../seed
# go run seed.go
```

# Usage
```
$ make up
```

# Note
プロキシ環境で実行できなかった場合は以下のように`make`を変更すること
```
$ make -f proxy.mk
```

# Author
- NUTMEG (技大祭実行委員会情報局)
- nutfes.info [at] gmail.com
