#テーブル設計

## users テーブル

|Column                  |Type       |Options           |
|----------------------- |---------- |----------------- |
| nickname               | string    |  null: false     |
| email                  | string    |  unique: true    |
| encrypted_password     | string    |  null: false     |
| firstname              | string    |  null: false     |
| lastname               | string    |  null: false     |
| kana_firstname         | string    |  null: false     |
| kana_lastname          | string    |  null: false     |
| birthday               | date      |  null: false     |


### Association
has_many :products
has_many :parchases


## products テーブル
|Column        |Type                  |Options                           |
|--------------|----------------------|----------------------------------|
| productname  | string               |  null: false                     |
| description  | text                 |  null: false                     |
| category_id  | string               |  null: false                     |
| status_id    | string               |  null: false                     |
| burden_id    | string               |  null: false                     |
| days_id      | string               |  null: false                     |
| price        | string               |  null: false                     |
| prefectures  | string               |  null: false                     |
| user         | references           |  null: false, foreign_key: true  |

### Association
belongs_to :user
has_one :parchase


## parchases テーブル
|Column           |Type                  |Options                          |
|-----------------|----------------------|-------------------------------- |
| user            | references           | null: false, foreign_key: true  |
| purchase        | references           | null: false, foreign_key: true  |

### Association
belongs_to :user
belongs_to :product
has_one :shipping


## shippings テーブル
|Column        |Type                  |Options                          |
|--------------|----------------------|-------------------------------- |
| prefectures  | string               | null: false                     |
| postalcode   | string               | null: false                     |
| municipality | string               | null: false                     |
| addres       | string               | null: false                     |
| building     | string               |                                 |
| phonenumber  | string               | null: false                     |
| user         | references           | null: false, foreign_key: true  |


### Association
belongs_to :parchase
