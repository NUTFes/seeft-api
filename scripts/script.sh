if [ "$(uname)" == 'Darwin' ]; then
    brew install sqldef/sqldef/mysqldef
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    curl -OL https://github.com/k0kubun/sqldef/releases/download/v0.11.20/mysqldef_linux_amd64.tar.gz
    tar xf mysqldef_linux_amd64.tar.gz -C /usr/local/bin/
else
    curl -OL https://github.com/k0kubun/sqldef/releases/download/v0.11.20/mysqldef_linux_amd64.tar.gz
    tar xf mysqldef_linux_amd64.tar.gz -C /usr/local/bin/
fi
