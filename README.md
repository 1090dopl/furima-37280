
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false  |
| birthday           | string | null:false  |

.has_many ：items



| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| category| string |null: false |
| price   | string | null :false |
| item     | string | null :false |

.has_one :purchases


| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| buyer | references | null: false, foreign_key: true |
|address | references | null: false, foreign_key: true |

.has_one :address
.has_one :items



| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_code | string  | null: false                         |
| user    | references | null: false, foreign_key: true |
| house_number    | references | null: false, foreign_key: true 

.belongs_to :purchases