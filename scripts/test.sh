#!/usr/bin/env sh

set -e

# bundle ex rake db:setup

bundle ex rspec --color spec/
