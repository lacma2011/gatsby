#!/bin/bash
nvm use 16

yarn --cwd /usr/src/ install
yarn --cwd /usr/src/ serve app
