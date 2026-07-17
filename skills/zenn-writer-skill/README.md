# Zenn Writer

Zenn向け日本語技術記事の構成、執筆、推敲、文体レビューを支援するCodex Skill。

技術的な正確さを保ちながら、入力材料に含まれる事実、観測、判断履歴、適用条件を記事へ反映する。

## 特徴

### 情報の扱い

- 外部情報、実際の観測、筆者の判断を区別する
- 入力材料にない体験、感情、発見、評価変更を作らない
- 失敗、留保、未確認事項、適用条件を結論の範囲として扱う

### 判断の記述

- 試した内容、観測結果、評価が変わった理由を必要な範囲で残す
- 判断と、その根拠となった観測を離しすぎない

### 文体と構成

- 一人称、疑問形、感情語、短文を、話者性のために機械的に追加しない
- 記事の目的に合わせて構成を決め、固定テンプレートを強制しない

### Zenn形式

- Front Matter、slug、記事ファイルの配置規則を確認する
- Zenn固有記法、画像、埋め込み、Mermaidの制約を維持する
- 対象リポジトリで利用できる場合はZenn CLIで表示を確認する

詳細な規則は[文体ルール](references/style-guide.md)と[Zenn Markdownリファレンス](references/zenn-markdown.md)に記載している。

## 対象

次の作業に使用する。

- Zenn向け技術記事の新規作成
- 既存記事の推敲
- 構成の整理
- 文体レビュー

次の作業には使用しない。

- コード実装だけの作業
- READMEや一般文書の作成
- コミットメッセージの作成
- 単純な翻訳

## インストール

このリポジトリをCodexのSkillsディレクトリへクローンする。

## 使い方

Codexで`$zenn-writer`を指定し、記事の目的、対象読者、使用する資料、出力先などを伝える。

### 新しい記事を書く

```text
$zenn-writer を使い、この実装内容からZenn記事を書く。
対象読者は、このライブラリを初めて使う開発者とする。
```

### 既存の記事を推敲する

```text
$zenn-writer を使い、この記事を推敲する。
技術的な主張とコードは変更しない。
```

根拠として使用できる入力材料の定義は、[文体ルール](references/style-guide.md)を参照する。

確認できない事実は推測で補わない。必要な情報が不足している場合は、確認できる範囲と確認できない範囲を区別して扱う。

## ファイル構成

```text
zenn-writer/
├── SKILL.md
└── references/
    ├── style-guide.md
    └── zenn-markdown.md
```

- [`SKILL.md`](SKILL.md): Skillの適用範囲と作業手順
- [`references/style-guide.md`](references/style-guide.md): 執筆と推敲で使用する文体ルール
- [`references/zenn-markdown.md`](references/zenn-markdown.md): Front Matter、Zenn固有記法、ファイル形式、確認項目
