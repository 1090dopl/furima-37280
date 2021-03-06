# users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana  | string  | null:false  |
|first_name_kana  | string |null: false   |
| email              | string | null: false ,unique: true|
| encrypted_password | string | null: false ,unique: true|
| nickname           | string | null: false ,unique: true |
| birthday           | date | null:false  |

.has_many ：items
.has_many :orders
.has_many :comments

# itemsテーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| category_id| integer |null: false |
| price   | integer | null :false |
| explanation     | text | null :false |
| charge_id  | integer | null  :false|
| status_id   | integer | null :false |
| user      | references   | null :false,foreign_key: true|
| day_id      | integer  | null :false |
| prefecture_id| integer | null :false|

.has_one :order
.belong_to :user
.has_many :comments

# ordersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |

.has_one :address
.belongs_to :item
.belongs_to :user


# addressesテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_code | string  | null  :false       |
| prefecture_id | integer | null :false |
| city       | string  | null :false  |
| house_number| string | null :false| 
| building_name | string |           |
| phone_number  |string |  null :false         |
| order  |references| null :false,foreign_key: true |

.belongs_to :order

# commentsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text | text  |       |
| user_id | integer |     |
| item_id       | string  |   |

.has_many :user
.has_many :item


