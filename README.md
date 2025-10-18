# 🧰 Laravel Shortcut Scripts

A growing collection of small, opinionated shell and CLI scripts that make working with Laravel a little less tedious.
Think of this as your `/bin` folder for daily Laravel sanity.

---

## 🚀 What’s Inside

Handy aliases and utilities for everyday Laravel workflows:

| Script | What It Does |
|---------|---------------|
| `artisan` | Runs the **closest** `php artisan` command from anywhere inside a Laravel project tree. Auto-detects Sail if available. |
| `cdlaravel` | Instantly `cd` into the nearest Laravel project root (the directory containing the `artisan` file). |
| `cache-clear-all` | Clear caches for all Laravel projects under a given directory (planned). |

Each script is meant to be standalone, readable, and easy to alias or modify.

---

## 🛠️ Installation

Clone the repo and add the `bin/` folder to your `$PATH`:

```bash
git clone https://github.com/yourusername/laravel-shortcuts.git
cd laravel-shortcuts
echo 'export PATH="$PATH:$HOME/workspace/laravel-shortcuts/bin"' >> ~/.bashrc
source ~/.bashrc
```

Or install with the Makefile:

```bash
# Install to /usr/local/bin (may need sudo)
make install

# Install to ~/.local/bin
make install PREFIX="$HOME/.local"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
```

Or use the helper script:

```bash
./install.sh --user
# or
sudo ./install.sh --system
```

---

## 🧩 Usage Examples

From **any directory inside a Laravel project**, run:

```bash
artisan migrate
artisan route:list
artisan tinker
```

Or jump straight to the project root:

```bash
cd "$(cdlaravel)"
```

If you’re not inside a Laravel project, you’ll get a helpful error message.

---

## 💡 Philosophy

These scripts exist for one reason: **speed**.
No global composer installs, no Docker dance. Just quick, reliable helpers that respect your existing setup.

---

## 🧑‍💻 Contributing

Pull requests welcome — just make sure your script:

1. Is POSIX-compliant (works in bash and zsh).
2. Handles spaces in directory names properly.
3. Doesn’t depend on external binaries that aren’t in a default macOS/Linux install.
4. Includes a short comment header describing its purpose.

If you submit something genuinely clever, expect a shout-out in the changelog.

---

## ⚖️ License

This project is licensed under the **MIT License** — see [LICENSE](./LICENSE) for details.
