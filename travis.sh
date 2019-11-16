#!/bin/bash

export XUO_TRAVIS=1

if [[ "$TASK" == "clang" ]]; then
	git clone https://github.com/crossuo/crossuo --depth 1
	echo Building Validator
	mkdir build && cd build && cmake -G Ninja ../crossuo && cmake --build . --target shardchk || exit 1
	cd ..
	./build/tools/xuoi/shardchk --path shards
fi
