# CLAUDE.md — AI開発ガイド

このファイルはAIアシスタント向けのプロジェクトガイドです。

## プロジェクト概要

nix-darwin + home-manager を使い、macOS 環境全体を Nix で宣言的に管理する dotfiles リポジトリ。
パッケージのインストール、システム設定、ユーザー設定を一括管理し、環境の再現性を担保する。

- **対象 OS:** macOS (aarch64-darwin)
- **Nix 構成名:** `personal`

## ファイル構成と役割

| ファイル | 役割 |
|---------|------|
| `flake.nix` | Nix flake エントリーポイント。inputs の固定と darwinConfiguration の定義 |
| `darwin.nix` | nix-darwin システム設定のルート。modules を import する |
| `home.nix` | home-manager ユーザー設定のルート。modules を import する |
| `modules/darwin/defaults.nix` | `system.defaults` による macOS GUI 設定（Dock, Finder 等）|
| `modules/darwin/packages.nix` | `environment.systemPackages` によるシステムワイドなパッケージ |
| `modules/home/zsh.nix` | zsh の設定、プラグイン、エイリアス、プロンプト |
| `modules/home/git.nix` | Git の設定、エイリアス、diff ツール |
| `modules/home/vscode.nix` | VSCode の拡張機能とユーザー設定 |

## 主要コマンド

```sh
# 設定の適用（通常の更新）
darwin-rebuild switch --flake .#personal

# 初回インストール時（nix-darwin 未インストールの場合）
nix run nix-darwin -- switch --flake .#personal

# flake の依存関係を更新
nix flake update

# ビルドのみ（適用しない）
darwin-rebuild build --flake .#personal

# 現在の設定を確認
nix flake show
```

## コーディング規約

### Nix のスタイル

- インデントは **スペース 2 つ**
- 属性セットの末尾にはセミコロン `;` を付ける
- 長いリストは 1 行 1 要素で記述する
- コメントは `#` を使い日本語で記述して良い

### モジュール設計

- 関心事ごとにファイルを分割する（`defaults.nix`, `packages.nix` 等）
- `darwin.nix` と `home.nix` はルートのみで、実装は `modules/` 配下に書く
- 新しいツールを追加する場合：
  - システムワイドなツール → `modules/darwin/packages.nix`
  - ユーザー設定があるツール → `modules/home/` に新ファイルを作成

### 機密情報の扱い

- SSH 鍵・API トークン等は絶対に Nix ファイルにハードコードしない
- `user.email` 等の個人情報はプレースホルダーを置いてコメントで明示する
- `.gitignore` で機密ファイルを除外する

## 依存関係

| Input | 用途 |
|-------|------|
| `nixpkgs` | パッケージ取得元（nixpkgs-unstable ブランチ）|
| `nix-darwin` | macOS システム設定管理 |
| `home-manager` | ユーザーレベルの設定管理 |

## よくあるトラブル

- **ビルドが失敗する場合:** `darwin-rebuild build --flake .#personal` でエラーを確認
- **パッケージが見つからない場合:** `nix search nixpkgs <パッケージ名>` で検索
- **設定が反映されない場合:** ターミナルを再起動するか `source ~/.zshrc` を実行
