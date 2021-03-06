## Status
Master [![Circle CI](https://circleci.com/gh/jphacks/TK_07/tree/master.svg?style=svg)](https://circleci.com/gh/jphacks/TK_07/tree/master)

Develop [![Circle CI](https://circleci.com/gh/jphacks/TK_07/tree/develop.svg?style=svg)](https://circleci.com/gh/jphacks/TK_07/tree/develop)

# knowlect 
## 製品概要
### 背景(製品開発のきっかけ、課題等）

社会ネットワーク分析には、「六次の隔たり」という用語が存在します．  
これは，世界中の人々をノードとし，人々の知り合い関係をエッジとした知り合い関係グラフにおいて，任意のノードから任意のノードに対して6ステップ以内で移動可能であるとする仮説です．  
ミルグラムのスモールワールド実験 1)によって検証が行われました．  
他にもスモールワールド現象についての研究は数多く行われています．

Wikipediaは，ユーザによって編集されるWeb上で閲覧できる百科事典です．
それぞれの項目では，関連する単語や事柄についてハイパーテキストリンクが張られています．
Wikipediaにおける項目と項目間のリンク構造は，一種のグラフと捉えることができます．

本アプリケーションでは，一つの巨大な知識のネットワークであるWikipediaについて，単語や事柄同士の「関係性」を明らかにし，「繋がり」を可視化します．

### 製品説明（具体的な製品の説明）
### 特長
####1. 単語と単語を「繋げる」．
単語と単語を繋げます．単語には一般的な名詞，固有名詞であればどんな言葉同士(*1)でも繋がります．
例えば「JavaScript」と「サボテン」，もしもこの2つに関係性があるのなら，一体どんな言葉で繋がるのか興味はありませんか?
そのような知的興味や発見を促進させます．
(* 1.Wikipediaに載っている範囲)

####2. 「繋がり」を可視化する．
この「繋がり」はグラフを用いて可視化されます．もし様々な繋がり方があるのならば，それらを比較したくはありませんか?
研究のサーベイや関連語句の手がかりとしてもこのアプリケーションは活用できます．

####3. 「繋がり」を支持する．
単語同士に優秀な繋がり，意外な繋がりを発見した時，それをボタンひとつで支持することが出来ます．


### 解決出来ること
* 単語と単語の間にある，未知の単語(知識)を発見できる．
* 無意味な単語(例えば年度)を除外し，関連の強い単語を探索できる．
* 単語というグラフィカルでないオブジェクトに対しての知識資源が可視化できる．
* 研究サーベイ時間の短縮．

### 注力したこと（こだわり等）
* 問題を最短経路問題に落とし込み，単語の最適なルートの組み合わせを発見する．
* Wikipediaという知識資源を活用することで，従来と異なる知識発見を促す．
* リンク中でも無意味なリンクを削減し，より直感的に，名詞同士での繋がりを目指した．

### 今後の展望
* 現実的な時間で経路を発見できるよう探索アルゴリズムを改善する．(分散処理)
* 項目間のリンクに対して，適切な重みを付与することでより関係性の強い単語によって形成される経路を発見する．
* 遺伝的アルゴリズムなどの準最適解を用いる事で，最適解以外の組み合わせを発見する．

## 開発技術
### 活用した技術
#### API・データ
* Wikipedia内の全知識情報

#### フレームワーク・ライブラリ・モジュール
* Client Side: React.js
* Server Side: Ruby on Rails
* Algorithm : 幅優先探索，(ダイクストラ法)

#### デバイス
* Webベースなので，スマートフォン他インターネットに繋がる全てのデバイスで活用できます．

### 独自技術
#### ハッカソンで開発した独自機能・技術
* Wikipedia内の全リンク情報を取得
* 要素の関連度を定義し，重み付け
* 最適な経路を探索するAPI

#### 製品に取り入れた研究内容（データ・ソフトウェアなど）（※アカデミック部門の場合のみ提出必須）
* Wikipedia(2,190,000件レコード)

* グラフ理論
* Milgram, S. "The Small-world Problem," Psychology Today, 1, 60–67.
* 野田陽平, 清田陽司, and 中川裕志. "Wikipedia カテゴリネットワークからの意外性のある関係性の抽出." 第 21 回セマンティックウェブとオントロジー研究会, SIG-SWO-A901-04 (2009): 1-4.
* 増田直紀, 今野紀雄. 「複雑ネットワーク」とは何か : 複雑な関係を読み解く新しいアプローチ. 講談社, 2006, 245p.