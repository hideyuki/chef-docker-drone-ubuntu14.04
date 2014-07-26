#!/bin/bash

rm -rf Berksfile.lock berks-cookbooks
bundle exec berks vendor

