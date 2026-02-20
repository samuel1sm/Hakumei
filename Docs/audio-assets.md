# Audio Assets

Place `.aac` pronunciation files in `Hakumei/Resources/Audio/`.

**Do not put README.md files inside the Hakumei/ source directory** — Xcode's file system
synchronization bundles every file in that tree, and two files named `README.md` in different
subdirectories will cause a "Multiple commands produce README.md" build error.

## Format

| Property    | Value          |
|-------------|----------------|
| Format      | AAC (.aac)     |
| Sample rate | 44.1 kHz       |
| Channels    | Mono           |
| Bitrate     | ~64 kbps       |
| Duration    | 0.5–1.5 s      |

## Naming convention

```
hiragana_<romaji>.aac    e.g.  hiragana_a.aac, hiragana_shi.aac
katakana_<romaji>.aac    e.g.  katakana_a.aac, katakana_shi.aac
word_<wordId>.aac        e.g.  word_coffee.aac
```

See `Services/AudioService.swift` → `audioFilename(for:)` for the mapping logic.
