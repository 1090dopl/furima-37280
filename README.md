# users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_reading  | string  | null:false  |
|first_name_reading  | string |null: false   |
| email              | string | null: false ,unique: true|
| encrypted_password | string | null: false |
| nickname           | string | null: false  |
| birthday           | date | null:false  |

.has_many ：items


# itemsテーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| category_id| integer |null: false |
| price   | integer | null :false |
| item     | string | null :false |
| charge_id  | integer | null  :false|
| status_id   | integer | null :false |
| user      | string   | null :false,foreign_key: true|
| day       | integer  | null :false |
| prefecture| integer  | null :false|

.has_one :purchases

# purchasesテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |

.has_one :address
.has_one :items 


# addressesテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_code | string  | null  :false       |
| prefecture | integer  | null :false |
| city       | string  | null :false  |
| house_number| string | null: false| 
| building_name | string |           |



.belongs_to :purchases