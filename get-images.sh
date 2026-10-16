#!/bin/sh
# Downloads your images from Squarespace's CDN into ./images so the site
# no longer depends on your Squarespace account. Run once from this folder:
#   sh get-images.sh
set -e
mkdir -p images
CDN="https://images.squarespace-cdn.com/content/v1/5fc446cf3398ff7515438a54"

curl -fL -o images/headshot.jpg \
  "$CDN/1613675590979-Z2TNPIELUHZHIP3XE72X/brendanpepplerheadshot?format=1000w"

curl -fL -o images/og.jpg \
  "https://static1.squarespace.com/static/5fc446cf3398ff7515438a54/t/5fd7a63e1ec3952e0d03aee3/1607968412574/Screen%2BShot%2B2020-12-14%2Bat%2B10.54.19%2BAM.jpg?format=1500w"

# Your old logo images (the site now uses a text wordmark; kept for reference)
curl -fL -o images/logo-2021.png \
  "$CDN/1613668856349-YSNY6QYITLRR8DJGIKBG/Screen+Shot+2021-02-18+at+11.20.20+AM.png?format=1500w"
curl -fL -o images/logo-2020.png \
  "$CDN/1607963614354-957N1C36ZQ8B9VD1N6U3/Screen+Shot+2020-12-14+at+10.33.22+AM.png?format=1500w"

echo "Done. Images saved to ./images"
