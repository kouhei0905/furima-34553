#テーブル設計

## users テーブル

|Column                  |Type       |Options                        |
|----------------------- |---------- |------------------------------ |
| nickname               | string    |  null: false                  |
| email                  | string    |  null: false, unique: true    |
| encrypted_password     | string    |  null: false                  |
| firstname              | string    |  null: false                  |
| lastname               | string    |  null: false                  |
| kana_firstname         | string    |  null: false                  |
| kana_lastname          | string    |  null: false                  |
| birthday               | date      |  null: false                  |


### Association
has_many :products
has_many :purchases


## products テーブル
|Column           |Type                  |Options                           |
|-----------------|----------------------|----------------------------------|
| productname     | string               |  null: false                     |
| description     | text                 |  null: false                     |
| genre_id        | integer              |  null: false                     |
| status_id       | integer              |  null: false                     |
| burden_id       | integer              |  null: false                     |
| d_day_id        | integer              |  null: false                     |
| price           | integer              |  null: false                     |
| prefecture_id   | integer              |  null: false                     |
| user            | references           |  null: false, foreign_key: true  |

### Association
belongs_to :user
has_one :purchase


## purchases テーブル
|Column           |Type                  |Options                          |
|-----------------|----------------------|-------------------------------- |
| user            | references           | null: false, foreign_key: true  |
| product         | references           | null: false, foreign_key: true  |

### Association
belongs_to :user
belongs_to :product
has_one :shipping


## shippings テーブル
|Column           |Type                  |Options                          |
|---------------- |----------------------|-------------------------------- |
| prefecture_id   | integer              | null: false                     |
| postalcode      | string               | null: false                     |
| municipality    | string               | null: false                     |
| addres          | string               | null: false                     |
| building        | string               |                                 |
| phonenumber     | string               | null: false                     |
| purchase        | references           | null: false, foreign_key: true  |


### Association
belongs_to :purchase
