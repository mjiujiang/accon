#!/bin/bash
target=fuelphp-accon
base_dir=~/Develop/master/accon/v2.0/data-volume/workspace/accon/docker
release_dir=~/Develop/master/accon/release

cd $release_dir

# バックアップディレクトリ作成
if [ ! -e $release_dir"/_backup" ]; then
	mkdir $release_dir"/_backup"
fi

# 配布モジュール格納先作成
if [ -e $release_dir"/fuelphp-accon" ]; then
	rm -Rf $release_dir"/fuelphp-accon"
fi

# 前回作成モジュールをバックアップ
if [ -e $release_dir"/"$target*.zip ]; then
	mv -f $release_dir"/"$target*.zip $release_dir"/_backup/"
fi

# リリース対象取得
cp -a $base_dir"/"$target ./

# リリースファイル作成
zip -r $target"_"`date +%Y%m%d`.zip $target
