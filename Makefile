setup:
	npm install -g elm-verify-examples elm-test elm
	elm package install

test:
	elm-verify-examples && elm-test

build:
	elm make

server:
	elm reactor
