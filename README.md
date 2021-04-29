# ubuntu-setup

自分用ubuntu初期設定ansible

## 使い方
設定対象として任意のユーザーでsshができるubuntu20.04を想定しています

### クライアントにインストール済のansibleを使う
このリポジトリをcloneし、setup.shを実行してください。  
設定中にdocker daemonの再起動を行うので自分自身の設定は出来ません。  
```
$ git clone git@github.com:negineri/ubuntu-setup.git
$ cp ubuntu-setup
$ ./setup.sh 設定を入れたいホストマシンのipアドレス ユーザー名 ユーザーパスワード
```

### それ以外
dockerを用いてansible実行用の使い捨てコンテナを利用することが出来ます。(IPv6アドレスを持つLinuxマシンのみ)  
このリポジトリをcloneし、Dockerfileを利用してください。
```
$ git clone git@github.com:negineri/ubuntu-setup.git
$ cp ubuntu-setup
$ sudo docker build -t ubuntu-setup .
$ sudo docker run --rm --net=host -v 暗号鍵のあるディレクトリの絶対パス:/root/.ssh ubuntu-setup 設定を入れたいホストマシンのipアドレス ユーザー名 ユーザーパスワード
```

### sshにパスワード認証を用いる
setup.shに第４引数としてパスワードを与えるとパスワード認証での接続を試みます
