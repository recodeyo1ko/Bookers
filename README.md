# Bookers

posting-book

## front & back

- ruby on rails

## Usage

### local

- `bundle install`,`yarn install`, `rails db:migrate`, `rails db:seed`

### docker

- `docker compose build`,`docker compose up (-d)`, `docker compose exec -it bookers sh`
- `yarn install`, `rails db:migrate`, `rails db:seed` in container

- main
  - posting-site
- task-a
  - SNS
- task-b
  - record
- task-c
  - community
- task-d
  - review

## todo

- task 統合
- devise (Gem)
  - 目標：Bookers2 にパスワードの変更機能・日本語化を実装する
- acts-as-taggable-on (Gem)
  - 目標：Bookers2 にタグ追加機能の実装
- ransack (Gem)
  - 目標：複数条件を用いた検索機能の実装
- slick (JS Library)
  - 目標：Bookers2 に slick を導入し、画像スライドショーを組み込む
- Google Maps Platform（API）
  - 目標：Bookers2 のマイページに自分の住所の地図を導入
