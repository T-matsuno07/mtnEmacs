# How to my Emacs

自作したemacsのキーバインドや機能について記載する

# キーバインド

## 切り取り貼り付け系
<dl>
<dt>Ctrl + Space </dt>
 <dd>範囲選択開始</dd>  
<dt>Ctrl + @ </dt>
 <dd>範囲選択開始</dd>  
<dt>Ctrl + Q > C</dt>
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
<dt>Ctrl + A</dt>
 <dd>カーソルを行頭へ移動→インデントの先頭へ移動</dd>  
<dt>Ctrl + B</dt>
 <dd>バッファ一覧表示</dd>  
 <dt>Ctrl + E</dt>
 <dd>カーソルを行末へ移動→改行</dd>  
 <dt>Ctrl + F</dt>
 <dd>1ワード分左へカーソルを移動(対義操作は Ctrl + L )</dd>  
 <dt>Ctrl + L</dt>
 <dd>1ワード分右へカーソルを移動(対義操作は Ctrl + F )</dd>  
<dt>Ctrl + O</dt>
 <dd>別のウィンドウへ移動</dd>  
<dt>Ctrl + P</dt>
  <dd>上の行へ移動(対義操作は Ctrl + N )</dd>  
<dt>Ctrl + N</dt>
 <dd>下の行へ移動(対義操作は Ctrl + P )</dd>  
<dt>Ctrl + V</dt>
 <dd>貼り付け</dd>
<dt>Ctrl + Shift + V</dt>
 <dd>クリップボード履歴貼り付け</dd>  
<dt>Ctrl + W</dt>
 <dd>選択中のワードを選択</dd>  
<dt>Ctrl + Z</dt>
 <dd>アンドゥ(Windowsと一緒)</dd>  
<dt>Ctrl + ]</dt>
  <dd>Esc -> X と一緒。ミニバッファコマンド表示</dd>
</dl>

## ファンクションキー系キーバインド
<dl>
<dt>F2</dt>
 <dd>タグジャンプ元へ戻る</dd>  
<dt>Ctrl + X > F2</dt>
  <dd>タグジャンプ用ファイルを再指定</dd>  
<dt>F3</dt>
   <dd>タグジャンプ(関数定義箇所を開く)</dd>  
<dt>Ctrl + X > F3</dt>
 <dd>タグファイル作成(要makefile)</dd>  
<dt>F4</dt>
 <dd>別ウィンドウでタグジャンプ</dd>  
<dt>F5</dt>
 <dd>GDB起動</dd>  
<dt>F6</dt>
 <dd>Compile(要makefile)</dd>  
<dt>F7</dt>
 <dd>occur (バッファ以内grep一覧表示)</dd>  
<dt>F8</dt>
 <dd>find-grep</dd>  
<dt>F9</dt>
 <dd>GDBにて実行行をカーソル行へ移動</dd>  
<dt>F10</dt>
  <dd>GDBにて見た目1行処理を実行(関数内へ進まない)</dd>  
<dt>F11</dt>
 <dd>GDBにて1ステップ実行(関数内へ進む)</dd>  
<dt>F12</dt>
  <dd>Undo Treeを表示</dd>  
</dl>

## Ctrl + Q キーバインド
emacsのデフォルト機能では，
Ctrl + Q には有益な機能が割り振られていない。  
そこで， Ctrl + Q には2ストロークコマンドのトリガーキーの役割を振っている。  
Ctrl + Qに続けて以下のコマンドを入力することでコマンドをオリジナルコマンドを実行出来る。

<dl>
<dt>Ctrl + Q > Ctrl + Q</dt>
 <dd>Viewモード(編集禁止モードへ)</dd>  
<dt>Ctrl + Q > Q</dt>
  <dd>mtn Studioモード起動(詳細は後述)</dd>  
<dt>Ctrl + Q > A</dt>
 <dd>カレントウィンドウ全体選択</dd>  
 <dt>Ctrl + Q > Ctrl + A</dt>
  <dd>カレント行全体選択</dd>  
<dt>Ctrl + Q > C</dt>
 <dd>コピー</dd>  
<dt>Ctrl + Q > D</dt>
   <dd>キーバインド一覧表示</dd>  
<dt>Ctrl + Q > E</dt>
      <dd>折り返し ON/OFF 切り替え</dd>  
<dt>Ctrl + Q > O</dt>
  <dd>別ウィンドウ (Ctrl + Oとは逆回り)</dd>  

<dt>Ctrl + Q > Ctrl + C</dt>
 <dd>コピー</dd>  
<dt>Ctrl + Q > Q</dt>
 <dd>C言語解析モード開始(mtnStudio機能起動)</dd>  
<dt>Ctrl + Q > O</dt>
 <dd>別ウィンドウ( Ctrl + Oとは逆順に選択する)</dd>  
<dt>Ctrl + Q > T</dt>
    <dd>タグジャンプ(関数定義箇所を開く)</dd>  
<dt>Ctrl + Q > Ctrl + T</dt>
  <dd>別ウィンドウでタグジャンプ</dd>  
<dt>Ctrl + Q > R</dt>
 <dd>置換</dd>  
<dt>Ctrl + Q > T</dt>
 <dd>タグジャンプ(F3と同様)</dd>  
<dt>Ctrl + Q > B</dt>
 <dd>タグジャンプ元に戻る(F2と同様)</dd>  
<dt>Ctrl + Q > G</dt>
 <dd>grep</dd>
</dl>

## ヘルプコマンド
Emacsの使い方を表示するヘルプコマンド。  
原則として、F1キーに続けて操作でemacsのデフォルトヘルプを表示することができる。
<dl>
<dt>F1 >  D</dt>
  <dd>キーバインド一覧を表示(一番使用頻度が高い)</dd>  
<dt>F1 >  C</dt>
    <dd>本コマンド入力後に入力したキーバインドに設定されているコマンド名を表示</dd>  
<dt>F1 >  K</dt>
    <dd>本コマンド入力後に入力したキーバインドの説明を表示</dd>  
</dl>
# 開発方
