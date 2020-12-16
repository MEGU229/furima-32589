# テーブル設計

## users テーブル

|      Column      | Type   |         Options         |
| ---------------- | ------ | ----------------------- |
|     nickname     | string |      null: false        |
|       email      | string |null: false, unique: true|
|      password    | string |       null: false       |
|     first_name   | string |       null: false       |
|    last_name     | string |       null: false       |
|first_name_reading| string |       null: false       |
| last_name_reading| string |       null: false       |
|      birthday    |  date  |       null: false       |

### Association

- has_many :items
- has_many :orders

## items テーブル

|     Column    |   Type   |     Options     |
| ------------- | -------- | --------------- |
|      name     |  string  |   null: false   |
|      text     |   text   |   null: false   |
|     price     | integer  |   null: false   |
|    category   | integer  |   null: false   |
|  condition    | integer  |   null: false   |
|shipping_cost  | integer  |   null: false   |
|shipment_source| integer  |   null: false   |
| days_to_ship  |   date   |   null: false   |
|      user     |references|foreign_key: true|

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column   |   Type   |    Options      |
| -------- | -------- | --------------- |
|   user   |references|foreign_key: true|
|   item   |references|foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresses

## addresses テーブル

|     Column     |   Type   |    Options      |
| -------------- | -------- | --------------- |
|   post_code    |   string |   null: false   |
|  prefectures   |  integer |   null: false   |
|      city      |  string  |   null: false   |
|  house_number  |  string  |   null: false   |
|  building_name |  string  |   null: false   |
|      user      |references|foreign_key: true|

### Association

- belongs_to :order
