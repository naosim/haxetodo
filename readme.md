# haxetodo
お昼休みの暇つぶしに  
haxeでtodoアプリをつくってみます。  
DDDも取り入れるかも。

# ロードマップ
- SP1: タスクの追加・状態変化(TODO <-> DONE)
- SP2: ストーリーの概念追加
  - ストーリー内のタスクは順番を持つ
  - ストーリーはタスクが全てDoneするとDoneになる
- SP3: バックログ、スプリントの概念追加
- その他やりたいこと
  - ServiceをAPI化
# コーディングの縛り
- ドットは2個まで(ただしthisの後のドットはノーカウント)
  - hoge.foo.value ok
  - this.hoge.foo.value thisはノーカウントってことでok
  - hoge.foo.bar.value NG
- jsライブラリはインターフェース越しにアクセスする
- DBは極力updateせずにinsertにする
- domainパッケージ
  - RepositoryとFactory以外でnewしない
  - DIは使わない
  - Service、Repositoryは結果をコールバックで返す
