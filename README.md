# agent-skills

個人用のAgent Skillsを管理するリポジトリ。

各Skillは独立したディレクトリに配置し、特定の作業方針や手順をAgentへ提供する。

## Skills

- [`brainstorming`](skills/brainstorming/)
  - 実装前の構造化された対話を通じて、曖昧なアイデアを検証済みの設計と仕様へ整理するAgent Skill。

- [`multi-agent-brainstorming`](skills/multi-agent-brainstorming/)
  - `brainstorming` で作成した設計を、複数の専門エージェントによる構造化ピアレビューで検証する。

- [`readme-bootstrap`](skills/readme-bootstrap/)
  - 新規リポジトリ向けに、最低限の日本語READMEと`LICENSE`ファイルを作成する。

- [`readme-writer`](skills/readme-writer/)
  - リポジトリ内の実装や設定、既存ドキュメントを調査し、日本語READMEの作成と修正を支援する。

- [`readme-localizer`](skills/readme-localizer/)
  - 日本語READMEを原文として、英語READMEを作成・更新する。

- [`m4l-reference`](skills/m4l-reference/)
  - Max for Liveデバイスの開発、調査、デバッグ、レビュー、互換性判断に、環境固有の参照先と互換性の境界を提供する。

- [`test-driven-development`](skills/test-driven-development/)
  - 期待する振る舞いを実装より先に明確にし、テストによるフィードバックを設計と実装に利用するAgent Skill。

- [`zenn-writer`](skills/zenn-writer/)
  - Zenn向け日本語技術記事の構成、執筆、推敲、文体レビューを支援する。

## 構成

```text
skills/
├── brainstorming/
├── multi-agent-brainstorming/
├── readme-bootstrap/
├── readme-writer/
├── readme-localizer/
├── m4l-reference/
├── test-driven-development/
└── zenn-writer/
```

各Skillの仕様と使用方法は、それぞれの `SKILL.md` に記載する。

## 作者

[m43d4k](https://github.com/m43d4k)

## ライセンス

[MIT License](LICENSE)
