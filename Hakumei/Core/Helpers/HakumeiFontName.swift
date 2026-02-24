// Typography.swift
// Hakumei — Japanese Learning App
// Design System · Font Definitions
//
// Usage:
//   Text("あ").font(.hakumei.kanaDisplay)
//   Text("Good morning").font(.hakumei.title1)
//
// Setup:
//   1. Add ShipporiMincho-Bold.ttf, ShipporiMincho-SemiBold.ttf,
//      DMSans-Regular.ttf, DMSans-Medium.ttf, DMSans-SemiBold.ttf
//      to your Xcode project and target membership.
//   2. Add all font file names to Info.plist under
//      "Fonts provided by application" (UIAppFonts).

import SwiftUI

// ─────────────────────────────────────────────
// MARK: - Font Name Constants
// ─────────────────────────────────────────────

enum HakumeiFontName {
	// Display — Shippori Mincho (Japanese-style serif)
	static let displayBold     = "ShipporiMincho-Bold"       // weight 800
	static let displaySemiBold = "ShipporiMincho-SemiBold"   // weight 600
	static let displayRegular  = "ShipporiMincho-Regular"    // weight 400

	// UI — DM Sans (clean, modern sans-serif)
	static let uiSemiBold = "DMSans-SemiBold"   // weight 600
	static let uiMedium   = "DMSans-Medium"      // weight 500
	static let uiRegular  = "DMSans-Regular"     // weight 400

	// Fallbacks (built-in iOS)
	static let fallbackJapanese = "HiraginoMincho-W3"
}

// ─────────────────────────────────────────────
// MARK: - Font Scale (8pt grid)
// ─────────────────────────────────────────────
//
//  10  · captionSmall  — romaji under grid cells, SRS intervals
//  11  · caption       — chip labels "DAILY REVIEW" (SemiBold, tracked)
//  12  · label         — rating buttons "Again / Hard / Good / Easy"
//  13  · bodySmall     — hints, examples, counter "3/12", app label
//  14  · body          — card subtitles, vocabulary words
//  15  · cardTitle     — card heading text
//  16  · button        — CTA buttons
//  18  · sectionTitle  — "Your Progress", "Learn New"
//  20  · kanaPreview   — progress card kana preview "あいう"
//  24  · kanaCell      — lesson grid cells
//  28  · display28     — ghost kana watermark, detail panel romaji
//  32  · title2        — "Session Complete!", stat numbers "9 / 3 / 75%"
//  36  · title1        — home greeting "Good morning, Alex さん"
//  48  · kanaHero      — daily review count "12"
//  52  · romajiDisplay — flashcard back romaji "ki"
//  80  · kanaLarge     — lesson detail panel selected character
//  96  · kanaDisplay   — flashcard front main character
//
// ─────────────────────────────────────────────

// ─────────────────────────────────────────────
// MARK: - HakumeiFont Namespace
// ─────────────────────────────────────────────

struct HakumeiFont {

	// ── Kana / Japanese Characters ─────────────────────────────────────

	/// 96pt · Shippori Mincho Bold
	/// Flashcard front — main kana character
	var kanaDisplay: Font {
		.custom(HakumeiFontName.displayBold, size: 96, relativeTo: .largeTitle)
	}

	/// 80pt · Shippori Mincho Bold
	/// Lesson detail panel — selected kana character
	var kanaLarge: Font {
		.custom(HakumeiFontName.displayBold, size: 80, relativeTo: .largeTitle)
	}

	/// 48pt · Shippori Mincho Bold
	/// Home dashboard — daily review count number
	var kanaHero: Font {
		.custom(HakumeiFontName.displayBold, size: 48, relativeTo: .title)
	}

	/// 24pt · Shippori Mincho SemiBold
	/// Lesson grid cells — each character
	var kanaCell: Font {
		.custom(HakumeiFontName.displaySemiBold, size: 24, relativeTo: .title2)
	}

	/// 20pt · Shippori Mincho Regular
	/// Progress card kana preview ("あいう", "アイウ")
	var kanaPreview: Font {
		.custom(HakumeiFontName.displayRegular, size: 20, relativeTo: .title3)
	}

	// ── Romaji ─────────────────────────────────────────────────────────

	/// 52pt · Shippori Mincho Bold
	/// Flashcard back — large romaji answer ("ki", "sa")
	var romajiDisplay: Font {
		.custom(HakumeiFontName.displayBold, size: 52, relativeTo: .largeTitle)
	}

	/// 28pt · Shippori Mincho Bold
	/// Shared: lesson detail panel romaji + ghost kana watermark on flashcard back
	/// Previously `romajiLarge` and `kanaGhost` — same size & weight, consolidated.
	var display28: Font {
		.custom(HakumeiFontName.displayBold, size: 28, relativeTo: .title2)
	}

	// ── Titles & Headings ──────────────────────────────────────────────

	/// 36pt · Shippori Mincho Bold
	/// Home header — "Good morning, Alex さん"
	var title1: Font {
		.custom(HakumeiFontName.displayBold, size: 36, relativeTo: .largeTitle)
	}

	/// 32pt · Shippori Mincho Bold
	/// Shared: session summary title "Session Complete!" + stat numbers "9 / 3 / 75%"
	/// Previously `title2` and `statNumber` — same size & weight, consolidated.
	var title2: Font {
		.custom(HakumeiFontName.displayBold, size: 32, relativeTo: .title)
	}

	/// 18pt · Shippori Mincho SemiBold
	/// Section labels — "Your Progress", "Learn New"
	var sectionTitle: Font {
		.custom(HakumeiFontName.displaySemiBold, size: 18, relativeTo: .title3)
	}

	// ── UI Text ────────────────────────────────────────────────────────

	var headerKanji: Font {
		.custom(HakumeiFontName.displayBold, size: 180, relativeTo: .body)
	}

	/// 16pt · DM Sans SemiBold
	/// CTA buttons — "Practice These 5 Characters →", "Back to Home"
	var button: Font {
		.custom(HakumeiFontName.uiSemiBold, size: 16, relativeTo: .body)
	}

	/// 15pt · DM Sans SemiBold
	/// Card titles — "Hiragana", "Katakana", "Hiragana — Row さ"
	var cardTitle: Font {
		.custom(HakumeiFontName.uiSemiBold, size: 15, relativeTo: .body)
	}

	/// 14pt · DM Sans Medium
	/// Body text — "cards due today", vocabulary words on flashcard back
	var body: Font {
		.custom(HakumeiFontName.uiMedium, size: 14, relativeTo: .body)
	}

	/// 13pt · DM Sans Regular
	/// Shared: secondary body (hints, mnemonic text) + counter "3 / 12"
	/// Previously `bodySmall` and `counter` — same size & weight, consolidated.
	var bodySmall: Font {
		.custom(HakumeiFontName.uiRegular, size: 13, relativeTo: .callout)
	}

	/// 13pt · DM Sans SemiBold · use with tracking 3.0
	/// App label "かな · HAKUMEI", row chip "Hiragana · Row さ"
	var appLabel: Font {
		.custom(HakumeiFontName.uiSemiBold, size: 13, relativeTo: .footnote)
	}

	/// 12pt · DM Sans Medium
	/// Rating button labels — "Again", "Hard", "Good", "Easy"
	var label: Font {
		.custom(HakumeiFontName.uiMedium, size: 12, relativeTo: .footnote)
	}

	/// 11pt · DM Sans SemiBold · use with tracking 1.5
	/// Chip labels — "DAILY REVIEW", "HOW WELL DID YOU REMEMBER?"
	var caption: Font {
		.custom(HakumeiFontName.uiSemiBold, size: 11, relativeTo: .caption)
	}

	/// 11pt · DM Sans Medium
	/// Bottom tab bar labels — "Home", "Learn", "Stats", "Settings"
	/// Same size as `caption` but Regular weight — intentionally different.
	var tabLabel: Font {
		.custom(HakumeiFontName.uiMedium, size: 11, relativeTo: .caption)
	}

	/// 10pt · DM Sans Regular
	/// Romaji under kana grid cells, SRS interval hints ("+1 day")
	var captionSmall: Font {
		.custom(HakumeiFontName.uiRegular, size: 10, relativeTo: .caption2)
	}
}

// ─────────────────────────────────────────────
// MARK: - Font Extension Entry Point
// ─────────────────────────────────────────────

extension Font {
	/// Access all Hakumei typography via `.hakumei.`
	///
	///     Text("あ").font(.hakumei.kanaDisplay)
	///     Text("Good morning").font(.hakumei.title1)
	///     Button("Start Review") { }.font(.hakumei.button)
	///
	static var hakumei: HakumeiFont { HakumeiFont() }
}

// ─────────────────────────────────────────────
// MARK: - View Modifier (optional convenience)
// ─────────────────────────────────────────────

struct HakumeiTextStyle: ViewModifier {
	let font: Font
	let tracking: CGFloat
	let lineSpacing: CGFloat

	func body(content: Content) -> some View {
		content
			.font(font)
			.tracking(tracking)
			.lineSpacing(lineSpacing)
	}
}

extension View {
	/// Apply a Hakumei text style with optional tracking and line spacing.
	func hakumeiStyle(
		_ font: Font,
		tracking: CGFloat = 0,
		lineSpacing: CGFloat = 0
	) -> some View {
		modifier(HakumeiTextStyle(font: font, tracking: tracking, lineSpacing: lineSpacing))
	}
}

// ─────────────────────────────────────────────
// MARK: - Predefined Text Styles
// ─────────────────────────────────────────────
//
// Convenience modifiers for the most common patterns.
// These encode tracking and line spacing rules from the design.
//
extension View {

	// ── Japanese display text (generous line height for readability) ──

	/// Flashcard front — large kana character
	func kanaDisplayStyle() -> some View {
		hakumeiStyle(.hakumei.kanaDisplay, lineSpacing: 4)
	}

	/// Lesson grid cells — each kana character
	func kanaCellStyle() -> some View {
		hakumeiStyle(.hakumei.kanaCell, lineSpacing: 2)
	}

	// ── Chip / label all-caps styles ─────────────────────────────────

	/// "DAILY REVIEW", "HOW WELL DID YOU REMEMBER?" — tight tracking
	func chipLabelStyle() -> some View {
		hakumeiStyle(.hakumei.caption, tracking: 1.5)
	}

	/// App label "かな · HAKUMEI", row tag "Hiragana · Row さ"
	func appLabelStyle() -> some View {
		hakumeiStyle(.hakumei.appLabel, tracking: 3.0)
	}

	// ── Body text ────────────────────────────────────────────────────

	/// Cards, lesson examples, vocabulary words
	func bodyStyle() -> some View {
		hakumeiStyle(.hakumei.body, lineSpacing: 5)
	}

	/// Secondary body — hints, mnemonic text
	func bodySmallStyle() -> some View {
		hakumeiStyle(.hakumei.bodySmall, lineSpacing: 4)
	}
}

// ─────────────────────────────────────────────
// MARK: - Font Availability Check (Debug)
// ─────────────────────────────────────────────

#if DEBUG
extension HakumeiFont {
	/// Call this in your AppDelegate or @main struct during DEBUG builds
	/// to verify all custom fonts loaded correctly.
	///
	///     HakumeiFont().debugPrintAvailability()
	///
	func debugPrintAvailability() {
		let required = [
			HakumeiFontName.displayBold,
			HakumeiFontName.displaySemiBold,
			HakumeiFontName.displayRegular,
			HakumeiFontName.uiSemiBold,
			HakumeiFontName.uiMedium,
			HakumeiFontName.uiRegular,
		]

		print("── Hakumei Font Availability ──────────────────")
		for name in required {
			let available = UIFont(name: name, size: 16) != nil
			print(available ? "  ✅ \(name)" : "  ❌ MISSING: \(name)")
		}
		print("───────────────────────────────────────────────")
	}
}
#endif

// ─────────────────────────────────────────────
// MARK: - Preview
// ─────────────────────────────────────────────

#Preview("Typography Scale") {
	ScrollView {
		VStack(alignment: .leading, spacing: 20) {

			Group {
				Text("── Kana Display").font(.caption).foregroundStyle(.secondary)
				Text("あいうえお")
					.font(.hakumei.kanaDisplay)
				Text("さしすせそ").font(.hakumei.kanaCell)
				Text("あいう").font(.hakumei.kanaPreview).foregroundStyle(.secondary)
			}

			Divider()

			Group {
				Text("── Romaji").font(.caption).foregroundStyle(.secondary)
				Text("ki").font(.hakumei.romajiDisplay)
				// display28 — shared by ghost kana + detail romaji
				Text("sa · ghost / detail romaji (display28)").font(.hakumei.display28)
			}

			Divider()

			Group {
				Text("── Titles").font(.caption).foregroundStyle(.secondary)
				Text("Good morning, Alex さん").font(.hakumei.title1)
				// title2 — shared by summary title + stat numbers
				Text("Session Complete! / 9 / 75% (title2)").font(.hakumei.title2)
				Text("Your Progress").font(.hakumei.sectionTitle)
			}

			Divider()

			Group {
				Text("── UI Scale").font(.caption).foregroundStyle(.secondary)
				Text("Start Review →").font(.hakumei.button)
				Text("Hiragana · Row さ").font(.hakumei.cardTitle)
				Text("cards due today").font(.hakumei.body)
				// bodySmall — shared by hints, examples, counter
				Text("さくら · sakura · 3/12 (bodySmall)").font(.hakumei.bodySmall)
				Text("かな · HAKUMEI").appLabelStyle()
				Text("DAILY REVIEW").chipLabelStyle()
				Text("Home · Learn (tabLabel)").font(.hakumei.tabLabel)
				Text("Again · +1 day (captionSmall)").font(.hakumei.captionSmall)
			}
		}
		.padding(24)
	}
}
