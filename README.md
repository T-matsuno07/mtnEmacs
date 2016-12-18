# How to my Emacs

自作したemacsのキーバインドや機能について記載する

# キーバインド

## 切り取り貼り付け系
<dl>
<dt>Ctrl + Space </dt>
 <dd>範囲選択開始</dd>  
<dt>Ctrl + @ </dt>
 <dd>範囲選択開始</dd>  
<dt>Ctrl + Q > c</dt>
 <dd>コピー (デフォルトは Esc > W)</dd>  
 <dt>Ctrl + X > Ctrl + X</dt>
  <dd>切り取り</dd>  
<dt>Ctrl + V</dt>
 <dd>貼り付け</dd>  
<dt>Ctrl + Y</dt>
 <dd>コピー履歴一覧から貼り付け</dd>  
</dl>

## 基本キーバインド
1つのキーバインドで実行されるコマンド。

<dl>
<dt>Ctrl + B</dt>
 <dd>バッファ一覧表示</dd>  
<dt>Ctrl + O</dt>
 <dd>別のウィンドウへ移動</dd>  
<dt>Ctrl + V</dt>
 <dd>貼り付け</dd>
<dt>Ctrl + Shift + V</dt>
 <dd>クリップボード履歴貼り付け</dd>  
<dt>Ctrl + W</dt>
 <dd>選択中のワードを切り取り</dd>  
<dt>Ctrl + Z</dt>
 <dd>アンドゥ(Windowsと一緒)</dd>  
<dt>Ctrl + ]</dt>
  <dd>Esc -> X と一緒。ミニバッファコマンド表示</dd>
</dl>

## Ctrl + Q キーバインド
emacsのデフォルト機能では，
Ctrl + Q には有益な機能が割り振られていない。  
そこで， Ctrl + Q には2ストロークコマンドのトリガーキーの役割を振っている。  
Ctrl + Qに続けて以下のコマンドを入力することでコマンドをオリジナルコマンドを実行出来る。

<dl>
<dt>A</dt>
 <dd>全体選択</dd>  
<dt>C</dt>
 <dd>コピー</dd>  
<dt>Ctrl + C</dt>
 <dd>コピー</dd>  
<dt>Q</dt>
 <dd>C言語解析モード開始(mtnStudio機能起動)</dd>  
<dt>O</dt>
 <dd>別ウィンドウ( Ctrl + Oとは逆順に選択する)</dd>  
<dt>Ctrl + T</dt>
 <dd>タグジャンプを別のウィンドウで開く</dd>  
<dt>R</dt>
 <dd>置換</dd>  
<dt>T</dt>
 <dd>タグジャンプ(F3と同様)</dd>  
<dt>B</dt>
 <dd>タグジャンプ元に戻る(F2と同様)</dd>  
<dt>G</dt>
 <dd>grep</dd>

</dl>

# 開発方
