# dotfiles

nix-darwin + home-manager で macOS 環境を管理する設定ファイル群。

## 構成

```
dotfiles/
├── flake.nix              # Nix flake エントリーポイント
├── darwin.nix             # nix-darwin システム設定
├── home.nix               # home-manager ユーザー設定
└── modules/
    ├── darwin/
    │   ├── defaults.nix   # macOS システム設定 (Dock, Finder 等)
    │   └── packages.nix   # システムワイドなパッケージ
    └── home/
        ├── zsh.nix        # zsh + プラグイン設定
        ├── git.nix        # Git 設定
        └── vscode.nix     # VSCode 拡張 + 設定
```

## セットアップ

### 前提条件

1. Nix のインストール

   ```sh
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

2. このリポジトリをクローン

   ```sh
   git clone https://github.com/nicky-tree55/dotfiles ~/.dotfiles
   cd ~/.dotfiles
   ```

### 初回適用

```sh
# nix-darwin が未インストールの場合
nix run nix-darwin -- switch --flake .#personal

# 2回目以降
darwin-rebuild switch --flake .#personal
```

### 更新

設定を変更した後は同じコマンドで適用する。

```sh
darwin-rebuild switch --flake .#personal
```

## 手動設定が必要な項目

以下は Nix で管理されないため、手動で設定する。

- SSH 鍵の生成・登録 (`~/.ssh/`)
- Git の `user.email` / `user.name`（`modules/home/git.nix` を編集）

## ライセンス

[MIT License](./LICENSE)
