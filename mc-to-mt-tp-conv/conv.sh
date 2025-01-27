#!/bin/bash
cd -- "$(dirname "$0")" || exit 1
cd .. || exit 1
rm -rf minetest-texture-pack
rm -rf uctextures
mkdir textures
mkdir uctextures
cd uctextures || exit 1
mkdir b
mkdir i
cd .. || exit 1

for f in "$(dirname "$0")/../assets/minecraft/textures/blocks/"*.png; do
	cp -- "$f" "uctextures/b/"
done
for f in "$(dirname "$0")/../assets/minecraft/textures/items/"*.png; do
	cp -- "$f" "uctextures/i/"
done

cd uctextures || exit 1

while read -r p; do
	if [ -n "$p" ]; then
		if [ -e "trans.png" ]; then
			mv trans.png "../textures/$p"
		else
			mv -- "$p" trans.png
		fi
	fi
done <../mc-to-mt-tp-conv/transtable.txt

#####################################
convert "b/destroy_stage_0.png" \
	"b/destroy_stage_1.png" \
	"b/destroy_stage_2.png" \
	"b/destroy_stage_3.png" \
	"b/destroy_stage_4.png" \
	"b/destroy_stage_5.png" \
	"b/destroy_stage_6.png" \
	"b/destroy_stage_7.png" \
	"b/destroy_stage_8.png" \
	"b/destroy_stage_9.png" \
	+append "../textures/crack-anylength.png"
#####################################

cd ..

mv textures minetest-texture-pack
