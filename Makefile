Q = @
ECHO = /bin/echo
CC = $(shell which rebar3 2> /dev/null || which ./rebar3)
MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PROJECT_DIR := $(shell dirname $(MKFILE_PATH))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))

.PHONY:	all check test clean

all:
	$(CC) compile

docs:
	$(CC) edoc

check:
	$(CC) check-plt
	$(CC) dialyzer

test:
	$(CC) eunit

conf_clean:
	@:

clean:
	rm -f $(PROJECT_DIR)/doc/erlang.png $(PROJECT_DIR)/doc/stylsheet.css $(PROJECT_DIR)/doc/stylsheet.css $(PROJECT_DIR)/doc/*.html
