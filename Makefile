.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	btcnano-wallet-client.min.js

clean:
	rm btcnano-wallet-client.js
	rm btcnano-wallet-client.min.js

btcnano-wallet-client.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

btcnano-wallet-client.min.js: btcnano-wallet-client.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
