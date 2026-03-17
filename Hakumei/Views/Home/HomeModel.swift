import Foundation

struct HomeModel {

	var greetingText: String
	var hiraganaProgress: Double
	var katakanaProgress: Double
	var hiraganaCountText: String
	var katakanaCountText: String
	var nextHiraganaRow: String
	var nextKatakanaRow: String

	private static let totalKanaPerType = 46

	init(allProgress: [CardProgress], allKana: [KanaCharacter], hour: Int) {
		let kanaLookup = Dictionary(uniqueKeysWithValues: allKana.map { ($0.id, $0) })

		// Greeting
		switch hour {
		case 5..<12: greetingText = "Good morning"
		case 12..<17: greetingText = "Good afternoon"
		case 17..<22: greetingText = "Good evening"
		default:      greetingText = "Good night"
		}

		// Character counts
		var hiraganaCount = 0
		var katakanaCount = 0

		for progress in allProgress {
			guard let character = kanaLookup[progress.characterId] else { continue }
			switch character.type {
			case .hiragana: hiraganaCount += 1
			case .katakana: katakanaCount += 1
			}
		}

		let total = Double(Self.totalKanaPerType)
		hiraganaProgress = Double(hiraganaCount) / total
		katakanaProgress = Double(katakanaCount) / total
		hiraganaCountText = "\(hiraganaCount) / \(Self.totalKanaPerType) characters"
		katakanaCountText = "\(katakanaCount) / \(Self.totalKanaPerType) characters"

		// Next rows
		nextHiraganaRow = Self.findNextRow(for: .hiragana, allProgress: allProgress, allKana: allKana, kanaLookup: kanaLookup)
		nextKatakanaRow = Self.findNextRow(for: .katakana, allProgress: allProgress, allKana: allKana, kanaLookup: kanaLookup)
	}

	private static func findNextRow(
		for type: KanaType,
		allProgress: [CardProgress],
		allKana: [KanaCharacter],
		kanaLookup: [String: KanaCharacter]
	) -> String {
		let nextRow = (allProgress
			.filter { kanaLookup[$0.characterId]?.type == type }
			.compactMap { kanaLookup[$0.characterId]?.row }
			.max() ?? 0) + 1

		return allKana
			.filter { $0.row == nextRow && $0.type == type }
			.reduce("") { $0 + $1.unicode }
	}
}
