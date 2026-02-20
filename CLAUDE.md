# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Test Commands

```bash
# Build
xcodebuild -project Hakumei.xcodeproj -scheme Hakumei -configuration Debug build

# Run all tests
xcodebuild -project Hakumei.xcodeproj -scheme Hakumei test

# Run a single unit test
xcodebuild -project Hakumei.xcodeproj -scheme Hakumei test -only-testing:HakumeiTests/HakumeiTests/testExample

# Run a single UI test
xcodebuild -project Hakumei.xcodeproj -scheme Hakumei test -only-testing:HakumeiUITests/HakumeiUITests/testExample

# Clean
xcodebuild -project Hakumei.xcodeproj clean
```

## Architecture

Hakumei is a kana (hiragana/katakana) learning app for iOS 26.0, built with SwiftUI + SwiftData. It is fully offline — no networking layer.

**Pattern:** MVVM with Combine for reactive state. ViewModels are `@Observable` classes in `ViewModels/`; views in `Views/` own a ViewModel instance via `@StateObject`.

**Persistence:** SwiftData only (no CoreData). Three models:
- `KanaCharacter` — the 92 kana characters (46 hiragana + 46 katakana), seeded from `Data/kana_data.json` on first launch.
- `UserProgress` — per-character SRS scheduling state (SM-2: easeFactor, interval, repetitions, nextReviewDate, correctStreak).
- `UserSettings` — single-row settings record (dailyGoal, streaks, feature toggles).

`ModelContainer` is created once in `HakumeiApp` and injected into the environment. Views reach the store via `@Query` (read-only lists) or `@Environment(\.modelContext)` (writes).

**Data seeding:** `HakumeiApp.seedDataIfNeeded()` runs on first launch. It decodes `kana_data.json` (bundled resource) into `KanaCharacter` records only when the store is empty.

**Navigation:** `ContentView` is a `TabView` with four tabs — Learn, Quiz, Progress (`ProgressTabView`, named to avoid shadowing SwiftUI's `ProgressView`), Settings. Each tab wraps its content in a `NavigationStack`.

**Folder layout inside `Hakumei/`:**
```
App/              (reserved for AppDelegate if needed)
Models/           KanaCharacter, UserProgress, UserSettings
ViewModels/       One ObservableObject per tab
Views/
  Learn/
  Quiz/
  Progress/       ProgressTabView
  Settings/
  Shared/         Reusable components (KanaCard, AudioButton, etc.)
Services/         SRSEngine, AudioService, StrokeEvaluator (stubs)
Resources/
  Audio/          .aac pronunciation files (see README)
  Mnemonics/      Mnemonic image assets (see README)
Data/             kana_data.json
```

**Kana ID convention in JSON:** hiragana use plain romaji (`"a"`, `"ka"`, `"shi"`); katakana append `_k` (`"a_k"`, `"ka_k"`, `"shi_k"`).

**Testing:** Unit tests use Swift Testing (`import Testing`); UI tests use `XCTest`. Both are scaffolded but unimplemented beyond the template stubs.

**Platform:** iOS 26.0, arm64, Xcode 26.1, Swift 5.0 compatibility mode.
