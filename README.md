# 🌍 Moooom! — World Moms for Claude Code

> Because every developer needs their mom yelling at them to drink water, eat food, and sit up straight.

A [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skill that summons moms from 10 different cultures to nag you — with love.

## Moms

| Mom | Flag | Language | Specialty |
|-----|------|----------|-----------|
| Turk Annesi | 🇹🇷 | Turkce | Cay, corap, "kuzum" |
| American Mom | 🇺🇸 | English | Cookies, Hydroflask, motivation speeches |
| British Mum | 🇬🇧 | British English | Proper tea, understatements, passive-aggressive concern |
| Mama Mexicana | 🇲🇽 | Spanglish | Chancla threats, veladoras for your code |
| Deutsche Mutti | 🇩🇪 | Deutsch + English | Efficiency, Butterbrot, structured breaks |
| Mamma Italiana | 🇮🇹 | Italiano + English | PASTA 🤌, drama, "mangia!" |
| Mama Espanola | 🇪🇸 | Espanol + English | Siesta advocacy, sacred lunch hours |
| Korean Eomma | 🇰🇷 | Korean + English | Tough love, banchan deliveries, "hwaitiiing!" |
| Japanese Okaasan | 🇯🇵 | Japanese + English | Gentle hints, bento boxes, "ne~" |
| Greek Mana | 🇬🇷 | Greek + English | Maximum drama, evil eye protection 🧿, spanakopita |

## Installation

### Quick Install (symlink)

```bash
# Clone
git clone https://github.com/mturac/moooom-claude.git ~/.claude/skills/moooom

# Or if you already have a skills directory structure:
ln -s /path/to/moooom-claude ~/.claude/skills/moooom
```

### Manual Install

1. Copy `SKILL.md` to `~/.claude/skills/moooom/SKILL.md`
2. (Optional) Copy `moooom-hook.sh` to `~/.claude/scripts/moooom-hook.sh`

That's it. Restart Claude Code and `/moooom` is ready.

## Usage

```bash
# Random mom, random mood
/moooom

# Pick a specific mom
/moooom turkish
/moooom italian
/moooom korean

# Pick a mood
/moooom mola          # Break reminder (Turkish)
/moooom break         # Break reminder (English)
/moooom yemek         # Food (time-aware!)
/moooom food          # Food (English)
/moooom teselli       # Comfort (when bugs hit)
/moooom comfort       # Comfort (English)
/moooom bilgelik      # Coding wisdom
/moooom wisdom        # Coding wisdom (English)

# Combine: mom + mood
/moooom greek comfort
/moooom japanese food
/moooom mexican wisdom
/moooom german break
```

## Moods

| Mood | Trigger | What happens |
|------|---------|-------------|
| **Random** | `/moooom` | Random mom says a random thing |
| **Break** | `mola` / `break` | Mom forces you to take a break + breathing exercise |
| **Food** | `yemek` / `food` | Time-aware meal reminders with cultural dishes |
| **Comfort** | `teselli` / `comfort` | Bug consolation — mom believes in you |
| **Wisdom** | `bilgelik` / `wisdom` | Coding tips, mom style |

## Hook (Optional)

`moooom-hook.sh` can be added to your Claude Code hooks for automatic mom appearances:

```json
// In ~/.claude/settings.json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/scripts/moooom-hook.sh start",
            "timeout": 3
          }
        ]
      }
    ],
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/scripts/moooom-hook.sh stop",
            "timeout": 3
          }
        ]
      }
    ]
  }
}
```

## Examples

**Turkish Mom on a late night:**
```
> /moooom turkish

🇹🇷 Gece gece kod mu yazilir kuzum?

───────────────────
❤️ Anne seni seviyor.
```

**Italian Mom at lunch:**
```
> /moooom italian food

🇮🇹 PRANZO! I made risotto. If you skip lunch,
I will personally fly there. 🤌

───────────────────
❤️ Mamma ti ama, tesoro. Adesso mangia. 🤌
```

**Greek Mom when you hit a bug:**
```
> /moooom greek comfort

🇬🇷 ΦΤΟΥ ΦΤΟΥ ΦΤΟΥ! 🧿 Someone gave your code mati.
Don't worry, mana will fix it. Try again.

───────────────────
❤️ Η μάνα σ'αγαπάει, μωρό μου! 🧿
```

## Why?

Because coding is hard, and sometimes you just need your mom to tell you to drink water and sit up straight. In 10 languages.

## Contributing

Got a mom from another culture? PRs welcome! Add a new section in `SKILL.md` following the existing pattern:

1. Flag + character description
2. 10 random phrases
3. Break, food (time-aware), comfort, wisdom lines
4. A signature line

## License

MIT — Mom would want you to share.

---

Made with ❤️ by [@mturac](https://github.com/mturac)

*"Kuzum su ic!" — Every Turkish Mom, Always*
