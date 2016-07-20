# terraform-hands-on

## Terraformハンズオンのサンプルコードです。

## 使い方
1. terraformのバイナリファイルを[ダウンロードページ](https://www.terraform.io/downloads.html)からダウンロード
2. ダウンロードしたZIPファイルを展開する
3. 展開し作成されたディレクトリを`terraform`にリネーム
4. WindowsならCドライブ直下に設置。OSXやLinuxなら`/opt`に設置
5. パスを通す
  * Windowsならコマンドプロンプト`set PATH=%PATH%;C:\terraform`を実行
  * OSX Linuxなら`export PATH=$PATH:/opt/terraform`
6. `terraform --varsion`と実行してバージョンが表示されるかチェック
7. AWSアカウントを用意します。
8. AWSアカウントにログインできたらEC2の管理画面からキーペアを作成
9. Terraform実行用のIAMユーザを作成します。※クレデンシャル情報が書かれたCSVファイルをダウンロードしておく
10. `AmazonEC2FullAccess`ポリシーを作成したIAMユーザにアタッチ
11. このレポジトリをローカルにcloneする。gitコマンドがない場合はZIPファイルをダウンロード。
12. `handson.tf`をテキストエディタで開く
12. VPCのCIDRを入力します。(ex. 10.0.0.0/16)
13. サブネットのCIDRをそれぞれ入力します。(ex. 10.0.1.0/24 10.0.11.0/24)
14. 作成したキーペアの名前を入れます
15. 起動したいインスタンスタイプを入力します(ex. t2.micro)
16. インスタンスに名前をつけます。

編集が終わったら保存して以下のコマンドを実行

```
terraform plan
```
このタイミングで先ほどダウンロードしたAWSのクレデンシャル情報を入力するよう求められるので入力します。

エラーがでなければさらに以下のコマンドを実行

```
terraform apply
```

再度AWSのクレデンシャル情報を入力します。

しばらくまつ。

無事完成するとURLがでてくるのでコピペしてアクセス。

乾杯っぽいWEBページが見れてたら完成。
