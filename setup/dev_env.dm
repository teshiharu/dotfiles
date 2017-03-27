# 1. 開発環境を作成
* CentOSのインストール
    * isoを落としてきてVirtualBoxを使ってインストール
    * メモリ1024MBディスク8GB
* ネットワークにつながるようにする
    * /etc/sysconfig/network-scripts/ifcfg-eth0のONBOOTをyesにしとく
    * /etc/init.d/network restart
* sshで作業アカウントに接続
    * 外部から接続できるように、virtualboxからネットワークアダプターを追加（ホストオンリーアダプター）
    * (IPadress 192.168.---はローカルのIP)
        * DEVICE=eth1
        * HWADDR=(MACアドレス)
        * TYPE=Ethernet
        * ONBOOT=yes
        * NM_CONTROLLED=yes
        * BOOTPROTO=static
        * IPADDR=192.168.56.103
        * NETMASK=255.255.255.0
        * NETWORK=192.168.56.0
    * /etc/init.d/network restart
* ユーザ追加
    * useradd teshima
    * passwd teshima
    * visudo   root ALL=(ALL)ALLの下にsudoを使いたいユーザを追加teshima ALL=(ALL)ALL

-----------------------------------------
ここまでroot / ここからuser
-----------------------------------------

* sudo yum -y install git
* Development toolsをインストール
    * yumコマンド
    * yum groupinstall "Development tools"
    * yum install git vim-enhanced nkf readline-devel wget curl man
* 鍵の設定
    * mkdir .ssh
    * touch .ssh/authorized_keys
    * chmod 700 .ssh
    * chmod 600 .ssh/authorized_keys
    * アクセス元で作った公開鍵の内容を、authorized_keysにコピペ

# 2. Perlのインストール
* perlbrew
    * curl -kL http://install.perlbrew.pl | bash
        * curl ファイルのダウンロードやアップロード
        * -k SSL/TLSのエラーをスキップ
        * -L リダイレクトに対応
* perlのインストール
    * source ~/perl5/perlbrew/etc/bashrc を.bashrc末尾に追加
    * source ~/perl5/perlbrew/etc/bashrc を.zshrc末尾に追加
    * source ~/.zshrc
    * perlbrew -A ccflags=-fPIC install perl-5.10.1
    * perlbrew switch 5.10.1

# 3. cpanmのインストール
* perlbrew install-cpanm
* sudo yum -y install perl-ExtUtils-MakeMaker

# 4. Catalystのインストール
* catalyst
    * cpanm Task::Catalyst
* iptables
    * sudo vim /etc/sysconfig/iptables
    * ルールに4行追加
        * -A INPUT -p tcp -m tcp --dport 3000 --syn -j ACCEPT
    * iptables -I
        * -p ルールで使われるプロトコルを指定
        * -m 使用するマッチ、特定の通信を検査する拡張モジュールを指定する
        * --dport ポート範囲の指定
        * --syn TCP接続の開始要求に使われるパケットを示す
        * -j パケットがルールにマッチした場合にどうするか
    * service iptables restart

# 5. MySQLのインストール
* MySQL
    * wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-client-5.5.38-1.el6.x86_64.rpm
    * wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-server-5.5.38-1.el6.x86_64.rpm
    * wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-shared-5.5.38-1.el6.x86_64.rpm
    * wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-shared-compat-5.5.38-1.el6.x86_64.rpm
    * wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-devel-5.5.38-1.el6.x86_64.rpm
    * wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-test-5.5.38-1.el6.x86_64.rpm
    * yum localinstall MySQL-*-5.5.38-1.el6.x86_64.rpm
    * sudo chkconfig mysql on
    * sudo /etc/init.d/mysql start
    * mysql> SET PASSWORD FOR root@localhost=PASSWORD('********');
* MySQL Workbench
    * 左上の＋ボタンからnew connection
        * 各種情報を入力してOK

# 6. gitのインストール
* 1.で完了済み

# 7. sambaのインストール
* sambaインストール
    * sudo yum -y install samba
* 設定ファイル
    * sudo vim /etc/samba/smb.conf
    * [global]
        unix charset = UTF-8
        dos charset = CP932
        display charset = UTF-8
* sambaユーザの設定
    * sudo pdbedit -a teshima
* iptables
    * sudo vim /etc/sysconfig/iptables
    * ルールに4行追加
        * -A INPUT -p tcp --dport 139 -j ACCEPT
        * -A INPUT -p udp --dport 137 -j ACCEPT
        * -A INPUT -p udp --dport 138 -j ACCEPT
        * -A INPUT -p tcp --dport 445 -j ACCEPT
    * sudo service iptables restart
* SELinux
    * sudo setenforce 0
    * sudo vim /etc/sysconfig/selinux
        * SELINUX=disabled に変更
* samba起動
    * sudo chkconfig smb on
    * sudo chkconfig nmb on
    * sudo service smb start
    * sudo service nmb start

# 8. tmuxのインストール
* PMforgeリポジトリをインストール
    * PMforge tmuxをインストールできるリポジトリを追加
    * wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
    * sudo rpm -ivh rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
        * i インストール
        * v 詳細を表示
        * h 進捗を#で表示
* tmuxをインストール
    * sudo yum install tmux

