## 概要
チーム開発で作成したaglicake(架空のケーキ屋)というケーキ屋さんのECサイトです。<br>

## バージョン
ruby・・・2.5.7<br>
rails・・・5.2.4.4<br>
nginx・・・1.19.3<br>
mysql・・・5.7

## ローカル環境での実行手順
dockerとdocker-composeを自分のpcにインストール

好きなディレクトリで<br>
`git clone https://github.com/Mac0917/aglicake.git`

移動<br>
`cd aglicake`

docker-composeを実行<br>
`docker-compose up -d`

データベース作成<br>
`docker exec -it bookers2-advance_app_1 bash`(コンテナに入る)<br>
`rails db:create`<br>
`rails db:migrate`

アクセス<br>
http://localhost/

終了<br>
`exit`(コンテナから出る)
`docker-compose stop`
`docker-compose rm`
`docker rmi bookers2-advance_app bookers2-advance_web`

