## SlugDockの記事一覧で公開状態を確認する

SlugDockの記事一覧に、Front Matterの`published`を基にしたステータス表示とフィルター機能を追加した。目的は、記事を開かなくても公開状態を一覧で確認できるようにすることだ。

今回の機能では、`published: false`と`published`未設定を別の状態として扱う。また、Bool以外の値から公開状態を推測せず、修正が必要な記事をErrorsフィルターで抽出できるようにした。

## `published`の値を4種類に分類する

記事のステータスは、Front Matterにある`published`の値と型から次のように分類する。

- `published: true`はPublished
- `published: false`はDraft
- `published`が存在しない場合はUnset
- `published`がBool以外の場合はFront Matter Error

DraftとUnsetを分けることで、`false`が設定されている記事と、`published`自体が存在しない記事を区別する。どちらもPublishedではないが、Front Matterに記録されている内容は異なるため、同じステータスにはまとめない。

## Front Matter Errorを独立させる理由

Front Matter Errorは、`published`が存在する一方で、その値がBoolではない状態だ。この状態をPublishedやDraftへ含めるには、Bool以外の値から公開状態を推測する必要がある。今回の分類では、その推測を行わない。

また、Front Matter ErrorをUnsetへ含めると、`published`が存在しない記事と、Bool以外の値が設定された記事を区別できなくなる。そのためFront Matter Errorを通常の状態から分け、Errorsフィルターの対象とした。修正が必要な記事は、このフィルターで抽出できる。

## フィルター、検索、Workspaceを開く操作

StatusフィルターにはAll、Draft、Published、Unset、Errorsを用意した。起動時のフィルターはAllである。表示するステータスを限定する場合は、対応するフィルターを選択する。

検索欄ではtitleまたはslugを検索できる。記事を選択してReturnキーを押すか、記事をダブルクリックするとWorkspaceを開く。公開状態の確認と、ステータスによる抽出、titleまたはslugによる検索、Workspaceを開く操作を記事一覧から行える。
