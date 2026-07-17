## SlugDockの記事一覧にステータス表示とフィルターを追加した

Zennの記事をGitHubリポジトリで管理していると、記事一覧にタイトルやslugが並んでいるだけでは、公開済みか下書きかを判別できない。確認のたびに各ファイルのFront Matterを開く必要があり、記事を探す操作と状態を確かめる操作が分かれてしまう。

そこでSlugDockの記事一覧に、Front Matterの`published`を基にしたステータス表示とフィルター機能を追加した。この記事では、ステータスの分類方法と、不正な値を通常の状態から分離した理由を説明する。

## `published`を4種類のステータスへ分類する

ステータスは`published`の有無、型、値によって決める。

- `published: true`はPublished
- `published: false`はDraft
- `published`が存在しない場合はUnset
- `published`がBool以外の場合はFront Matter Error

この分類では、`false`と未設定を同じ下書きとして扱わない。`false`はBool値が明示されている状態だが、Unsetはフィールド自体が存在しない状態だからだ。記事一覧に両者を別々に表示することで、Front Matterに記録されている事実を保ったまま状態を確認できる。

## Front Matter Errorを通常の状態から分ける

`published`が存在していても、値がBoolでなければPublishedにもDraftにも分類できない。この状態をUnsetへ含めると、「フィールドがない記事」と「フィールドはあるが型が異なる記事」の区別が失われる。

また、Bool以外の値から公開状態を推測すると、一覧側がFront Matterに書かれていない意味を補うことになる。そのため、不正な型はFront Matter Errorとして独立させた。これにより、公開状態として扱える記事と、値を確認する必要がある記事を混同せずに表示できる。

## ステータスと検索から記事を探す

StatusフィルターにはAll、Draft、Published、Unset、Errorsを用意した。起動時はAllを選択し、すべての記事を表示対象とする。状態を限定したい場合は、対応するフィルターへ切り替える。

検索欄ではtitleまたはslugを検索できる。目的の記事を見つけたら、記事を選択してReturnキーを押すか、記事をダブルクリックするとWorkspaceが開く。ステータスの確認、記事の絞り込み、Workspaceを開く操作を記事一覧から行えるようになった。
