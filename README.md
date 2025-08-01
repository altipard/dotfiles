# Dotfiles

Meine persönliche macOS-Konfiguration mit automatisierter Installation.

## Struktur

```
.dotfiles/
├── zsh/          # Zsh Konfiguration
├── git/          # Git Konfiguration
├── nvim/         # Neovim Konfiguration
├── tmux/         # Tmux Konfiguration
├── homebrew/     # Homebrew Packages (Brewfile)
├── aerospace/   # Aerospace Window Manager
├── karabiner/    # Karabiner-Elements (Keyboard Remapping)
├── ghostty/      # Ghostty Terminal
├── macos/        # macOS-spezifische Einstellungen
├── bin/          # Eigene Scripts
└── config/       # Weitere App-Konfigurationen
```

## Installation

```bash
# Repository klonen
git clone https://github.com/daltiparmak/dotfiles.git ~/.dotfiles

# Installation ausführen
cd ~/.dotfiles
./install.sh
```

## Update

```bash
cd ~/.dotfiles
./update.sh
```

## Features

- **Modularer Aufbau**: Jede Komponente in eigenem Ordner
- **Automatische Backups**: Bestehende Configs werden gesichert
- **Homebrew Bundle**: Alle Packages in einer Datei definiert
- **Symlink-Management**: Einfache Verwaltung der Konfigurationsdateien
- **Aerospace Window Manager**: Tiling Window Manager mit Meh-Key Setup
- **Deutsche Tastatur optimiert**: Collision-free Shortcuts via Space-Bar

## Komponenten

### Zsh
- Minimale Basis-Konfiguration
- Modular erweiterbar durch `.zsh` Dateien
- Unterstützt lokale Overrides via `.zshrc.local`

### Homebrew
- Alle Packages in `homebrew/Brewfile` definiert
- Automatische Installation via `brew bundle`

### Aerospace Window Manager
Moderner Tiling Window Manager für macOS mit Workspace-Management.

#### Warum Aerospace mit Meh-Key?
Auf deutschen Mac-Tastaturen ist die Option/Alt-Taste für Sonderzeichen reserviert:
- `Alt+N` = ~
- `Alt+L` = @
- `Alt+E` = €
- `Alt+8` = {
- `Alt+9` = }

Die Lösung: **Meh-Key** (Shift+Ctrl+Alt) über die Space-Taste!

#### Key-Konzept
- **Space-Taste gedrückt halten** = Meh-Key (Shift+Ctrl+Alt)
- **Space-Taste antippen** = Normales Leerzeichen
- **Rechtes Cmd + Space** = Hyper-Key (Shift+Ctrl+Alt+Cmd)

#### Workspace-Organisation
Workspaces sind nach mnemonischen Gruppen organisiert:
- `Space+B` → **B**rowser (Chrome, Safari, Firefox)
- `Space+C` → **C**ode/Development (VSCode, IntelliJ)
- `Space+M` → **M**essages (WhatsApp, Mail, Slack, Teams)
- `Space+T` → **T**erminal (iTerm, Terminal, Ghostty)
- `Space+V` → **V**ideo/Virtual Meetings (Zoom, Teams)
- `Space+D` → **D**ocumentation (Obsidian, Notion)
- `Space+E` → **E**ntertainment (Spotify, YouTube)
- `Space+F` → **F**inder/Files
- `Space+G` → **G**it/GitHub Desktop
- `Space+N` → **N**otes
- `Space+P` → **P**roductivity (Calendar, Reminders)
- `Space+R` → **R**esearch (Browser für Recherche)
- `Space+S` → **S**ystem/Settings
- `Space+U` → **U**tilities
- `Space+W` → **W**ork (arbeitsspezifische Apps)
- `Space+1-9` → Numerische Workspaces für Overflow

#### Window Management
- `Space+H/J/K/L` → Fenster fokussieren (Vim-Style)
- `Space+Cmd+H/J/K/L` → Fenster verschieben
- `Space+Buchstabe` → Zu Workspace wechseln
- `Space+Cmd+Buchstabe` → Fenster zu Workspace verschieben
- `Space+Space` → Layout umschalten
- `Space+Enter` → Vollbild
- `Space+Q` → Fenster schließen

#### Resize Mode
- `Space+;` → Resize-Modus aktivieren
  - `H/J/K/L` → Größe ändern (50px Schritte)
  - `Shift+H/J/K/L` → Feineinstellung (10px Schritte)
  - `ESC` oder `Enter` → Resize-Modus verlassen

### Karabiner-Elements
Ermöglicht die Space-Bar als Modifier-Key zu nutzen:
- Konfiguration in `karabiner/karabiner.json`
- Profil "Aerospace Meh Key" wird automatisch erstellt
- Nach Installation in Karabiner-Elements aktivieren

### Ghostty
Modernes GPU-beschleunigtes Terminal mit nativer macOS-Integration.

## Anpassung

1. **Lokale Einstellungen**: Erstelle `~/.zshrc.local` für maschinenspezifische Configs
2. **Neue Module**: Lege `.zsh` Dateien in `zsh/` ab, werden automatisch geladen
3. **Packages**: Bearbeite `homebrew/Brewfile` und führe `./update.sh` aus
4. **Workspace-Anpassung**: Bearbeite `aerospace/aerospace.toml` für eigene Workspace-Definitionen
5. **Keyboard-Remapping**: Erweitere `karabiner/karabiner.json` für zusätzliche Tastenkombinationen