# README

## Description
  自分がおすすめしたい商品を動画として投稿できるサイト。
  動画を見て気に入ったら商品を購入。
  自分自身品物を購入する場合はYOUTUBE動画を見てから購入した方が失敗が少ない
  という経験からこのサイトを作りました。
  将来的には他人も動画をUPすることを可能にし動画経由で商品が売れれば
  収益が入る仕組みにしていく予定です。

## Precautions
  あくまでデモンストレーション目的で作ったサイトです。
- pay.jpはテスト仕様にしています。実際購入はできません
- 使いやすくするためバリデーションをかけていません
- 容量が重くなりすぎないため動画の画質は落としています

## DEMO

## Features

- HAML/SASS記法マークアップ
- AWS EC2へのデプロイ
- AWS S3への画像・動画アップロード
- pay.jpによる購入処理
- devise gemを使用した新規登録、ログイン機能
- (予定)Jqueryによるインクリメンタルサーチ機能
- (予定)利益表作成機能

## Requirement

- Ruby 2.5.1
- Rails 5.2.3

## Installation

- $ git clone http://github.com/muracchi1582/Recommend-product.git
- $ cd Recommend-product
- $ bundle install

## Author 
1名による単独開発
- masatoshi muraoka

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|encrypted_password|string|null: false|
|reset_password_token|string|
|reset_password_sent_at|date|
|remember_created_at|date|
|name|string|

### Association
- has_many :videos
- has_many :histories
- has_many :products


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|
|movie|string|
|image|string|
|price|integer|
|user_id|integer
|information|text|

### Association
- belongs_to :user
- has_many :histories


## historiesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|product_id|integer|
|price|integer|

### Association
- belongs_to :user
- belongs_to :product