## サービス名　：　アングリーカードジェネレータ(仮)
### サービス概要
俺のターン！ドロー！ストレスをアングリーカードとして召喚！</br>
イラッとしたりモヤッとしたり・・日常のちょっとしたストレスを</br>
カードゲーム風に遊び心を持って昇華させるためのアプリです。

### メインのターゲットユーザー
* 日常の中でプチストレスを感じることがある人</br>
* ストレスをネタにして昇華したい人

### ユーザーが抱える課題
* ストレスを深刻にしたくない</br>
* ストレスを笑いに変えたい</br>
* ストレスを気軽に解消して気持ちを切り替えたい</br>
* ストレスをネタにして伝えたい

### 解決方法
入力した文章からAIがあなたのストレスの姿を画像生成し、オリジナルのアングリーカードを召喚します。</br> 
あなたのストレスはどんなアングリーカードになって現れるでしょうか。</br>
召喚されたカードを見て、クスッと笑えて気持ちが昇華できるかもしれないし、友達に共有してネタとして昇華することもできます。</br>
また、墓地に送られたアングリーカードはユーザー同士で共有でき、他ユーザーのストレスに共感したり、自分のストレスを客観視して気持ちが昇華できるかも・・。

### 実装予定の機能
* 未登録ユーザー
  * ユーザー登録できる
  * トップページが閲覧できる
  * 墓地に送られた他者のカード一覧ページが閲覧できる
  * ゲストユーザーとしてアングリーカードを召喚できる
    * 投稿フォームに気持ちを入力する
      * アングリーカードが生成される
        * 入力された文章から画像生成してカードの挿絵ができる
        * フォームに入力した文章がカードの説明文に入る
        * 入力したストレスの数値が、カードの強さとして表示される
  * アングリーカードを墓地に送ると墓地一覧ページに公開され、他ユーザーとカードを共有できる
* 登録ユーザー
  * ログイン、ログアウトできる
  * アングリーカードを召喚できる
    * 投稿フォームに気持ちを入力する
      * アングリーカードが生成される
        * 入力された文章から画像生成してカードの挿絵ができる
        * フォームに入力した文章がカードの説明文に入る
        * 入力したストレスの数値が、カードの強さとして表示される
      * アングリーカードをSNSで共有できる
  * アングリーカードを墓地に送ると墓地一覧ページに公開され、他ユーザーとカードを共有できる
  * マイページでマイアングリーカードを管理できる
    * 自分が作成したアングリーカードを一覧表示できる
  * 墓地に送られた他者のカード一覧ページが閲覧できる
  * ユーザー登録を削除できる

### 今後実装してみたい機能
* マイページ機能
  * 自分が作成したアングリーカードを、☆(ストレス度合い)や日付で絞り込み検索し、</br>
    どんなことにストレスを感じたか、後で日記のように振り返ることができる
* 墓地に送られた他者のアングリーカードに「共感」ボタンを設置する
* 「共感」したカードの一覧を表示できる
* ストレスをカタチにしてネタにする手法としてカードゲーム風にしたので、少しゲーム性を持たせられると良い・・。

### なぜこのサービスを作りたいのか？
「お釣りを投げるように渡す店員にイラっ」「上司の嫌味にムカっ」「上手にサボってる同僚にモヤモヤ・・」「飲みに行って連絡をしない夫にイライラ〜っ」。</br>
日常の中で何かとストレスを感じたとき、つい他人(夫とか夫とか)に当たったり、SNSに書き殴って後悔することも・・。</br>
モヤモヤの感情に引っ張られて、気持ちが上がらないこともある。</br>
でも、ストレスの感じ方も千差万別で、さっさと気持ちを切り替えられる人やネタに昇華できる人もいる。</br>
私も日常で感じるストレスを、おもしろおかしくネタに昇華してあまり深刻に受け止めずに済めば良いのにな。</br>
ストレス解消方法の一つの手段として使ってもらい、少しでもストレス解消の手助けになれば嬉しい。

### スケジュール
企画〜技術調査及びREADME〜ER図作成：1/31〆切</br>
メイン機能実装：2/1 - 3/3</br>
β版をRUNTEQ内リリース（MVP)：3/4〆切</br>
本番リリース：3/17

### 画面遷移図
Figma:[https://www.figma.com/file/I92jn5XpN6kTMQp2NKFACK/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0%3A1&t=kvu9CHs5CFARt3WC-1]