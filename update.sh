#!/usr/bin/env bash

#
# Script for updateding package repository.
#
# @copyright  copyright (c) 2020-present by Harald Lapp
# @author     Harald Lapp <harald@octris.org>
#

if [ ! -d gh-pages ]; then
  git clone git@github.com:octris/composer.git gh-pages -b gh-pages --depth=1
else
  (cd gh-pages && git pull)
fi

vendor/bin/satis build satis.json gh-pages "$@"

cd gh-pages && \
  git add * && \
  git commit -m "updated repository" && \
  git push
