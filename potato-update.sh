#!/bin/bash
set -e

cd /packages/apps/kyrros
git pull
cp potato.sh ../../../potato.sh
cd ../../../