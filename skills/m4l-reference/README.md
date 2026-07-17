# m4l-reference

Max for Liveデバイスの開発、調査、デバッグ、レビュー、互換性判断に、環境固有の参照先と互換性の境界を提供する。

調査方法と資料の選択はAgentへ委ねる。

## 設定

`settings.toml`に、ユーザーが管理する参照先の場所を設定する。

```toml
[paths]
guidelines_dir = "~/path/to/guidelines"
playbooks_dir = "~/path/to/playbooks"
sources_dir = "~/path/to/sources"
```

- `guidelines_dir`: Max for Live作業へ適用するユーザー指示
- `playbooks_dir`: ユーザー固有の実践情報
- `sources_dir`: 公式Web資料のURL、用途、バージョン上の注意

## 方針

guidelinesをMax for Live作業へ適用する。

利用できる参照資料は次のとおり。

- playbooksにあるユーザー固有の実践情報
- 対象Live内蔵MaxのObject Reference、User Guide、help、Examples
- sourcesに記録された公式Web資料



- playbooksにある、ユーザー固有の実践情報
- 対象Live内蔵MaxのObject Reference、User Guide、help、Examples
- sources_dirディレクトリ内の、公式Web資料のURL、用途、バージョン上の注意

参照資料には固定の優先順位を設けない。

- 互換性は対象Liveと、そのLiveに内蔵されたMaxを基準とする。
- スタンドアロンMaxや別バージョンを暗黙に代用しない。
- 確認できない内容を仕様として断定しない。
- 通常作業中に参照資料やSkill自体を勝手に更新しない。
