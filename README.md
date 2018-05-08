# README


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|email|string|null: false|
|introducton|text|
|icon_image|string|

### Association
- has_many :cooks


## cooksテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|user_id|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :foodstuffs
- has_many :cook_images
- has_many :makes


## cook_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|picture|string|null: false|
|cook_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :cook


## makesテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|cook_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :cook
- has_many :make_images

## make_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|picture|string|null: false|
|make_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :make


## seasonsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|best_foodstuff_id|integer|null: false, foregin_key: true|

### Association
- has_many :foodstuffs, through: :best_foodstuffs
- has_many :best_foodstuffs

## foodstuffsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|cook_id|string|null: false, foregin_key: true|
|season_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :cook
- has_many :seasons, through: :best_foodstuffs
- has_many :best_foodstuffs

## best_foodstuffsテーブル

|Column|Type|Options|
|------|----|-------|
|season_id|string|null: false, foregin_key: true|
|foodstuff_id|string|null: false, foregin_key: true|


### Association
- belongs_to :season
- belongs_to :foodstuff


## site
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :site_infomations


## site_infomation
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|url|string|null: false|
|image_url|string|

### Association
- belongs_to :site
