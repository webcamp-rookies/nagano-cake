# **NaganoCake**

# 概要

長野県にある小さな洋菓子店「ながの CAKE」の商品を通販するための EC サイトです。

# アプリケーションの詳細な説明・実装機能

「ながの CAKE」の通販サイトで、注文に応じて製作する受注生産型。
顧客が操作する会員側機能と、店側が操作する管理側機能がある。

### 1.会員側機能

- 顧客は会員登録、ログイン・ログアウト、退会ができます。
- 会員のログインはメールアドレスとパスワードで⾏えます。
- 会員がログインしている状態だと、ページのヘッダーにユーザ名が表示されます。
- サイトの閲覧はログインなしで⾏えます。
- 商品をカートに⼊れ、1 度に複数種類、複数商品の購⼊ができます。また、カート 内の商品は個数変更・削除ができます。
- カートへの商品追加はログインなしでは⾏えません。
- クレジットカード情報はシステム上保持されません。
- 会員はマイページからユーザ情報の閲覧・編集、注⽂履歴の閲覧、配送先の閲覧・ 編集ができます。
- 注⽂履歴⼀覧には下記の情報が表⽰されます。
  - 注⽂⽇
  - 配送先
  - ⽀払⾦額(商品合計＋送料)
  - 注⽂ステータス
- 注⽂履歴詳細には下記の情報が表⽰されます。
  - 注⽂⽇
  - 配送先
  - ⽀払⽅法
  - 注⽂ステータス
  - 商品の注⽂内容詳細（商品名、単価、個数、⼩計）
  - 請求情報（商品合計、送料、⽀払⾦額）
    会員登録時、下記の情報をユーザ情報として⼊⼒できます。
  - 名前（姓・名）
  - 名前（カナ姓・カナ名）
  - 郵便番号
  - 住所
  - 電話番号
  - メールアドレス
  - パスワード
- 商品は税込価格で表⽰されます。（消費税 10％）

### 2.管理者側機能

- 管理者⽤メールアドレスとパスワードでログインできます。
- 商品の新規追加、編集、販売停⽌（売切表⽰）が⾏えます。
- 商品情報は下記のものを保持しています。
  - 商品名
  - 商品説明⽂
  - ジャンル
  - 税抜価格
  - 商品画像
  - 販売ステータス
- 会員登録されているユーザ情報の閲覧、編集、退会処理が⾏えます。
- ユーザの注⽂履歴が⼀覧・詳細表⽰できます。
- 注⽂履歴には注⽂ごとに下記の情報が表⽰されます。
  - 購⼊者
  - 購⼊⽇
  - 購⼊内容
  - 請求額合計
  - 配送先
  - 注⽂ステータス
  - 各注⽂商品の製作ステータス
- 注⽂ステータス、製作ステータスの更新ができます。
- 商品ジャンルには「有効」「無効」を設定できます。無効に設定したジャンル は、ジャンル⼀覧に表⽰されません。また、無効になっているジャンルに紐付く 商品は表⽰されません。

### 3.用語の定義

| 用語           | 意味                                                                                                      |
| -------------- | --------------------------------------------------------------------------------------------------------- |
| 顧客           | ながの CAKE の商品を購入する人（客）                                                                      |
| 会員           | EC サイトにユーザーを登録している顧客                                                                     |
| EC サイト      | 顧客が利用するサイト                                                                                      |
| 管理サイト     | 店で働く事務員・パティシエ等が利用するサイト（管理者用サイト）                                            |
| 注文ステータス | 注文の状態遷移を表す（後述）                                                                              |
| 製作ステータス | 注文に紐付く注文商品の状態遷移を表す（後述）                                                              |
| 販売ステータス | 長品の販売状況を表す。現状、販売中・売り切れの 2 パターンがある。販売停止商品は「売り切れ」をセットする。 |
| 会員ステータス | 現状、有効・退会の 2 パターンがある。                                                                     |
| ジャンル       | 商品の種類。現状、ケーキ・プリン・焼き菓子・キャンディの 4 ジャンルある。                                 |
| 注文個数       | 1 回の注文に紐付く注文個数の合計。例）商品 A を 3 個、商品 B を 2 個注文 → 注文個数は 5 個。              |
| 商品小計       | 商品単価（税込）× 　個数。例）1,200 円（税込）の商品を 2 個購入＝商品小計は 2,400 円                      |

# 開発環境

### 使用言語

- HTML&CSS
- Ruby

### フレームワーク

- Ruby on rails (5.2.4.4)

### Gem

- device
- refile
- refile-mini-magick
- dotenv-rails
- bootstrap-sass
- jquery-rails
- kaminari

# 使用方法

### 顧客側

1. はじめに会員登録をお願い致します。登録なしに商品を閲覧することは可能ですが、注文する際は必須になります。
2. お好きな商品が見つかりましたらカートに入れていただき、注文情報入力へお進みください。
3. 支払い方法、配送先等を選択していただき、注文確定を押すと注文が完了いたします。

### 管理者側

1. まず管理者登録をお願いいたします。登録が完了しますと、管理者機能が使用可能になります。
2. ジャンルと商品を登録していただきますと、顧客サイトで閲覧が可能になります。
3. 顧客から注文がありますと、注文一覧に表示され、詳細が確認できます。入金が確認できたら注文ステータスを変更し、製作が終了しましたら製作ステータスを変更してください。（それぞれ連動して変更が反映されます）
4. 顧客一覧から顧客詳細の確認・変更・退会が可能です。

# 作成者

チームルーキーズ
