# Zenn Markdownリファレンス

## 目次

1. [この文書の使い方](#1-この文書の使い方)
2. [公式情報源](#2-公式情報源)
3. [記事ファイル](#3-記事ファイル)
4. [Front Matter](#4-front-matter)
5. [本文の基本記法](#5-本文の基本記法)
6. [Zenn独自の記法](#6-zenn独自の記法)
7. [画像](#7-画像)
8. [完成時の確認](#8-完成時の確認)

## 1. この文書の使い方

この文書は、Zennの記事ファイルを作成、編集、レビューするときに確認する要点をまとめたものである。文体と記事構成は`style-guide.md`、Zenn固有のファイル形式と記法はこの文書を参照する。

仕様の正本はZenn公式ドキュメントとする。この文書と公式ドキュメントが異なる場合は、最新の公式ドキュメントを優先する。対象リポジトリでZenn CLIを利用できる場合は、最終的な表示をプレビューでも確認する。

## 2. 公式情報源

2026年7月15日時点で、次の公式資料を確認している。

- [ZennのMarkdown記法一覧](https://zenn.dev/zenn/articles/markdown-guide)
- [Zenn CLIで記事・本を管理する方法](https://zenn.dev/zenn/articles/zenn-cli-guide)
- [Zennのスラッグ（slug）とは](https://zenn.dev/zenn/articles/what-is-slug)
- [GitHubリポジトリ連携で画像をアップロードする方法](https://zenn.dev/zenn/articles/deploy-github-images)
- [zenn-editorのZenn CLIサンプル記事](https://github.com/zenn-dev/zenn-editor/tree/canary/packages/zenn-cli/articles)

`zenn-editor`内のサンプルは記法例として使用できるが、公開中の公式ドキュメントと差がある場合は公式ドキュメントを優先する。

## 3. 記事ファイル

GitHub連携またはZenn CLIで管理する記事は、1記事につき1つのMarkdownファイルを`articles`ディレクトリへ置く。

```text
articles/
└── example-article.md
```

ファイル名から拡張子を除いた部分がslugになる。slugは次の条件を満たす必要がある。

- 半角英小文字`a-z`、数字`0-9`、ハイフン`-`、アンダースコア`_`だけを使う
- 12文字以上50文字以下にする
- slugはコンテンツ種別ごとにZenn全体で一意である必要があり、他のユーザーが使用しているslugも使用できない
- ローカルリポジトリ内で重複していないことだけを根拠に、slugが使用可能だと判断しない
- 公開後にslugを変えると別の記事として扱われるため、不用意に変更しない

既存リポジトリに配置規則や作成コマンドがある場合は、その規則を優先する。

## 4. Front Matter

記事ファイルの先頭にはYAML形式のFront Matterを置く。

```yaml
---
title: "記事タイトル"
emoji: "📝"
type: "tech"
topics: ["topic1", "topic2"]
published: false
---
```

基本項目の意味は次のとおりである。

- `title`: 記事タイトル
- `emoji`: アイキャッチとして使う絵文字1文字
- `type`: `tech`または`idea`
- `topics`: 記事に付けるトピックの配列
- `published`: `true`で公開、`false`で下書き

公開日時を指定する場合は`published_at`を使用する。

```yaml
published: true
published_at: 2050-06-12 09:03
```

- 形式は`YYYY-MM-DD`または`YYYY-MM-DD hh:mm`
- タイムゾーンはJST
- 未来の日時は公開予約として扱われる
- 過去の公開日時は一度だけ指定でき、設定後は変更できない

Front Matterを扱うときは次を守る。

- 既存記事では、依頼なく値や項目順を変更しない
- 新規記事では、ユーザー指定またはリポジトリの既存形式を優先する
- 公開を明示されていない記事を、判断だけで`published: true`にしない
- `published_at`を推測で追加または変更しない

## 5. 本文の基本記法

一般的なMarkdownに加えて、Zennでの表示を考慮する。

### 見出し

記事タイトルはFront Matterの`title`に置く。本文の見出しはアクセシビリティの観点から`##`で始めることが公式に推奨されている。見出しレベルを飛ばさず、階層を保つ。

### コードブロック

言語名を指定してシンタックスハイライトを適用する。

````markdown
```js
const value = 1;
```
````

ファイル名は`言語:ファイル名`で指定する。

````markdown
```js:example.js
const value = 1;
```
````

diff表示では`diff`、言語名、必要ならファイル名を指定する。

````markdown
```diff js:example.js
-const value = 1;
+const value = 2;
```
````

コード、言語名、ファイル名を文章上の都合で変更しない。

### 数式

インライン数式は`$...$`、ブロック数式は`$$`で囲む。ブロック数式の前後には空行を置く。ZennはKaTeXで表示するため、LaTeXのすべての機能が使えるとは限らない。

### 脚注

通常の脚注とインライン脚注を使用できる。

```markdown
本文の脚注[^1]とインライン脚注^[脚注の内容]。

[^1]: 脚注の内容
```

### コメント

公開画面に表示しないメモには、1行のHTMLコメントを使用できる。複数行のHTMLコメントには対応していない。

```html
<!-- TODO: 検証結果を追記する -->
```

## 6. Zenn独自の記法

### メッセージ

補足には`message`、重大な注意には`message alert`を使用する。

```markdown
:::message
補足内容
:::

:::message alert
警告内容
:::
```

装飾目的で多用せず、本文中での役割に合わせて選ぶ。

### アコーディオン

長い補足や、必要な読者だけが参照する内容には`details`を使用できる。

```markdown
:::details タイトル
折りたたむ内容
:::
```

コンテナをネストする場合は、外側のコロンを増やして境界を区別する。

```markdown
::::details タイトル
:::message
ネストした内容
:::
::::
```

### リンクカードと埋め込み

URLだけを独立した行に置くと、対応するURLはカードまたは埋め込みとして表示される。リンクカードを明示する場合は`@[card](URL)`を使用できる。

```markdown
https://zenn.dev/zenn/articles/markdown-guide

@[card](https://zenn.dev/zenn/articles/markdown-guide)
```

埋め込み対応サービスと推奨記法は変わり得る。新しく埋め込みを追加するときや既存記法を変更するときは、公式Markdown記法一覧を確認する。

### Mermaid

Mermaidは言語名`mermaid`のコードブロックで記述する。

````markdown
```mermaid
graph LR
  A --> B
```
````

Zenn上では次の制限がある。

- クリックイベントは無効
- 1ブロックは2000文字以内
- フローチャートの`&`によるChainは10以下

Mermaid側の変更でも表示が変わる可能性があるため、複雑な図はZenn CLIで確認する。

## 7. 画像

通常の画像記法を使用できる。

```markdown
![Altテキスト](https://example.com/image.png)
```

URLの後ろに`=幅x`を付けると表示幅をpx単位で指定できる。

```markdown
![Altテキスト](https://example.com/image.png =500x)
```

画像の直後にイタリックの行を置くと、キャプションとして表示される。

```markdown
![Altテキスト](https://example.com/image.png)
*画像の説明*
```

GitHub連携リポジトリ内の画像には次の制約がある。

- リポジトリ直下の`/images`ディレクトリへ置く
- 本文から`/images/...`で始まる絶対パスで参照する
- 1ファイルを3MB以内にする
- 拡張子は`.png`、`.jpg`、`.jpeg`、`.gif`、`.webp`を使用する

相対パスへ書き換えない。画像を削除するとZenn上からも削除されるため、参照中の画像を不用意に削除しない。

## 8. 完成時の確認

記事の作成または編集後に、依頼範囲に応じて次を確認する。

- Front Matterの必須項目とYAML構文が保たれている
- `type`、`published`、`published_at`を勝手に変更していない
- 見出し階層が連続している
- コードフェンスとZenn独自コンテナが閉じている
- コードブロックの言語名とファイル名が内容に合っている
- 画像のAltテキスト、パス、拡張子、サイズが適切である
- URLだけの行や埋め込み記法を通常リンクへ壊していない
- 数式やMermaidがZennの制約を満たしている

対象リポジトリにZenn CLIが導入済みなら、既存のプロジェクト手順に従ってプレビューする。

```bash
npx zenn preview
```

検証のためだけにグローバルインストールや依存関係の追加を行わない。プレビューできなかった場合は、その理由と未確認範囲を報告する。
