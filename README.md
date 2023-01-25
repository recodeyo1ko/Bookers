# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

|課題|要件|
|--|--|
|課題 7b|	ユーザ詳細ページに、今日の投稿数を表示させる|
||ユーザ詳細ページに、前日の投稿数を表示させる
||ユーザ詳細ページに、前日と今日の投稿数の差を表示させる
||(今日の数値 / その前日の数値)
||ユーザ詳細ページに、今週の投稿数の合計を表示させる
||例：本日 →2021/05/21（金）の場合
||　　 2021/05/15（土） ~ 2021/05/21（金）が今週と解釈
||ユーザ詳細ページに、先週の投稿数の合計を表示させる
||例：本日 →2021/05/21（金）の場合
||　　 2021/05/08（土）~ 2021/05/14（金）が前週と解釈
||ユーザ詳細ページに、今週と先週の投稿数の差を表示させる(先週と比べる)
|課題 8b|	過去 7 日間分、それぞれの投稿数を一覧表示させる
||chart.js を使って、過去 7 日分の投稿数グラフ化
|課題 9b|	ユーザ詳細ページに、指定した日の記録(投稿数)を非同期で表示させる