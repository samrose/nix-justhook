build:
    gcc src/main.c -o simple-project

test: build
    chmod +x test/test.sh
    ./test/test.sh

install:
    mkdir -p ${out}/bin
    cp simple-project ${out}/bin/

default: build