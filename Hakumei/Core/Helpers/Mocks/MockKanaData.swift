import Foundation
import SwiftData

@MainActor
struct MockKanaData {
	
	/// All 46 Hiragana characters
	static let hiraganaCharacters: [KanaCharacter] = [
		// Row 1: あ行 (a-row)
		KanaCharacter(id: "hiragana_a", unicode: "あ", romaji: "a", type: .hiragana, row: 1, strokeCount: 3),
		KanaCharacter(id: "hiragana_i", unicode: "い", romaji: "i", type: .hiragana, row: 1, strokeCount: 2),
		KanaCharacter(id: "hiragana_u", unicode: "う", romaji: "u", type: .hiragana, row: 1, strokeCount: 2),
		KanaCharacter(id: "hiragana_e", unicode: "え", romaji: "e", type: .hiragana, row: 1, strokeCount: 2),
		KanaCharacter(id: "hiragana_o", unicode: "お", romaji: "o", type: .hiragana, row: 1, strokeCount: 3),
		
		// Row 2: か行 (ka-row)
		KanaCharacter(id: "hiragana_ka", unicode: "か", romaji: "ka", type: .hiragana, row: 2, strokeCount: 3),
		KanaCharacter(id: "hiragana_ki", unicode: "き", romaji: "ki", type: .hiragana, row: 2, strokeCount: 4),
		KanaCharacter(id: "hiragana_ku", unicode: "く", romaji: "ku", type: .hiragana, row: 2, strokeCount: 2),
		KanaCharacter(id: "hiragana_ke", unicode: "け", romaji: "ke", type: .hiragana, row: 2, strokeCount: 3),
		KanaCharacter(id: "hiragana_ko", unicode: "こ", romaji: "ko", type: .hiragana, row: 2, strokeCount: 2),
		
		// Row 3: さ行 (sa-row)
		KanaCharacter(id: "hiragana_sa", unicode: "さ", romaji: "sa", type: .hiragana, row: 3, strokeCount: 3),
		KanaCharacter(id: "hiragana_shi", unicode: "し", romaji: "shi", type: .hiragana, row: 3, strokeCount: 1),
		KanaCharacter(id: "hiragana_su", unicode: "す", romaji: "su", type: .hiragana, row: 3, strokeCount: 2),
		KanaCharacter(id: "hiragana_se", unicode: "せ", romaji: "se", type: .hiragana, row: 3, strokeCount: 3),
		KanaCharacter(id: "hiragana_so", unicode: "そ", romaji: "so", type: .hiragana, row: 3, strokeCount: 2),
		
		// Row 4: た行 (ta-row)
		KanaCharacter(id: "hiragana_ta", unicode: "た", romaji: "ta", type: .hiragana, row: 4, strokeCount: 4),
		KanaCharacter(id: "hiragana_chi", unicode: "ち", romaji: "chi", type: .hiragana, row: 4, strokeCount: 2),
		KanaCharacter(id: "hiragana_tsu", unicode: "つ", romaji: "tsu", type: .hiragana, row: 4, strokeCount: 1),
		KanaCharacter(id: "hiragana_te", unicode: "て", romaji: "te", type: .hiragana, row: 4, strokeCount: 1),
		KanaCharacter(id: "hiragana_to", unicode: "と", romaji: "to", type: .hiragana, row: 4, strokeCount: 2),
		
		// Row 5: な行 (na-row)
		KanaCharacter(id: "hiragana_na", unicode: "な", romaji: "na", type: .hiragana, row: 5, strokeCount: 4),
		KanaCharacter(id: "hiragana_ni", unicode: "に", romaji: "ni", type: .hiragana, row: 5, strokeCount: 3),
		KanaCharacter(id: "hiragana_nu", unicode: "ぬ", romaji: "nu", type: .hiragana, row: 5, strokeCount: 2),
		KanaCharacter(id: "hiragana_ne", unicode: "ね", romaji: "ne", type: .hiragana, row: 5, strokeCount: 2),
		KanaCharacter(id: "hiragana_no", unicode: "の", romaji: "no", type: .hiragana, row: 5, strokeCount: 1),
		
		// Row 6: は行 (ha-row)
		KanaCharacter(id: "hiragana_ha", unicode: "は", romaji: "ha", type: .hiragana, row: 6, strokeCount: 3),
		KanaCharacter(id: "hiragana_hi", unicode: "ひ", romaji: "hi", type: .hiragana, row: 6, strokeCount: 1),
		KanaCharacter(id: "hiragana_fu", unicode: "ふ", romaji: "fu", type: .hiragana, row: 6, strokeCount: 4),
		KanaCharacter(id: "hiragana_he", unicode: "へ", romaji: "he", type: .hiragana, row: 6, strokeCount: 1),
		KanaCharacter(id: "hiragana_ho", unicode: "ほ", romaji: "ho", type: .hiragana, row: 6, strokeCount: 4),
		
		// Row 7: ま行 (ma-row)
		KanaCharacter(id: "hiragana_ma", unicode: "ま", romaji: "ma", type: .hiragana, row: 7, strokeCount: 3),
		KanaCharacter(id: "hiragana_mi", unicode: "み", romaji: "mi", type: .hiragana, row: 7, strokeCount: 2),
		KanaCharacter(id: "hiragana_mu", unicode: "む", romaji: "mu", type: .hiragana, row: 7, strokeCount: 3),
		KanaCharacter(id: "hiragana_me", unicode: "め", romaji: "me", type: .hiragana, row: 7, strokeCount: 2),
		KanaCharacter(id: "hiragana_mo", unicode: "も", romaji: "mo", type: .hiragana, row: 7, strokeCount: 3),
		
		// Row 8: や行 (ya-row)
		KanaCharacter(id: "hiragana_ya", unicode: "や", romaji: "ya", type: .hiragana, row: 8, strokeCount: 3),
		KanaCharacter(id: "hiragana_yu", unicode: "ゆ", romaji: "yu", type: .hiragana, row: 8, strokeCount: 2),
		KanaCharacter(id: "hiragana_yo", unicode: "よ", romaji: "yo", type: .hiragana, row: 8, strokeCount: 2),
		
		// Row 9: ら行 (ra-row)
		KanaCharacter(id: "hiragana_ra", unicode: "ら", romaji: "ra", type: .hiragana, row: 9, strokeCount: 2),
		KanaCharacter(id: "hiragana_ri", unicode: "り", romaji: "ri", type: .hiragana, row: 9, strokeCount: 2),
		KanaCharacter(id: "hiragana_ru", unicode: "る", romaji: "ru", type: .hiragana, row: 9, strokeCount: 1),
		KanaCharacter(id: "hiragana_re", unicode: "れ", romaji: "re", type: .hiragana, row: 9, strokeCount: 1),
		KanaCharacter(id: "hiragana_ro", unicode: "ろ", romaji: "ro", type: .hiragana, row: 9, strokeCount: 1),
		
		// Row 10: わ行 (wa-row)
		KanaCharacter(id: "hiragana_wa", unicode: "わ", romaji: "wa", type: .hiragana, row: 10, strokeCount: 2),
		KanaCharacter(id: "hiragana_wo", unicode: "を", romaji: "wo", type: .hiragana, row: 10, strokeCount: 3),
		KanaCharacter(id: "hiragana_n", unicode: "ん", romaji: "n", type: .hiragana, row: 10, strokeCount: 1),
	]
	
	/// All 46 Katakana characters
	static let katakanaCharacters: [KanaCharacter] = [
		// Row 1: ア行 (a-row)
		KanaCharacter(id: "katakana_a", unicode: "ア", romaji: "a", type: .katakana, row: 1, strokeCount: 2),
		KanaCharacter(id: "katakana_i", unicode: "イ", romaji: "i", type: .katakana, row: 1, strokeCount: 2),
		KanaCharacter(id: "katakana_u", unicode: "ウ", romaji: "u", type: .katakana, row: 1, strokeCount: 3),
		KanaCharacter(id: "katakana_e", unicode: "エ", romaji: "e", type: .katakana, row: 1, strokeCount: 3),
		KanaCharacter(id: "katakana_o", unicode: "オ", romaji: "o", type: .katakana, row: 1, strokeCount: 3),
		
		// Row 2: カ行 (ka-row)
		KanaCharacter(id: "katakana_ka", unicode: "カ", romaji: "ka", type: .katakana, row: 2, strokeCount: 2),
		KanaCharacter(id: "katakana_ki", unicode: "キ", romaji: "ki", type: .katakana, row: 2, strokeCount: 3),
		KanaCharacter(id: "katakana_ku", unicode: "ク", romaji: "ku", type: .katakana, row: 2, strokeCount: 2),
		KanaCharacter(id: "katakana_ke", unicode: "ケ", romaji: "ke", type: .katakana, row: 2, strokeCount: 3),
		KanaCharacter(id: "katakana_ko", unicode: "コ", romaji: "ko", type: .katakana, row: 2, strokeCount: 2),
		
		// Row 3: サ行 (sa-row)
		KanaCharacter(id: "katakana_sa", unicode: "サ", romaji: "sa", type: .katakana, row: 3, strokeCount: 3),
		KanaCharacter(id: "katakana_shi", unicode: "シ", romaji: "shi", type: .katakana, row: 3, strokeCount: 3),
		KanaCharacter(id: "katakana_su", unicode: "ス", romaji: "su", type: .katakana, row: 3, strokeCount: 2),
		KanaCharacter(id: "katakana_se", unicode: "セ", romaji: "se", type: .katakana, row: 3, strokeCount: 2),
		KanaCharacter(id: "katakana_so", unicode: "ソ", romaji: "so", type: .katakana, row: 3, strokeCount: 2),
		
		// Row 4: タ行 (ta-row)
		KanaCharacter(id: "katakana_ta", unicode: "タ", romaji: "ta", type: .katakana, row: 4, strokeCount: 3),
		KanaCharacter(id: "katakana_chi", unicode: "チ", romaji: "chi", type: .katakana, row: 4, strokeCount: 3),
		KanaCharacter(id: "katakana_tsu", unicode: "ツ", romaji: "tsu", type: .katakana, row: 4, strokeCount: 3),
		KanaCharacter(id: "katakana_te", unicode: "テ", romaji: "te", type: .katakana, row: 4, strokeCount: 3),
		KanaCharacter(id: "katakana_to", unicode: "ト", romaji: "to", type: .katakana, row: 4, strokeCount: 2),
		
		// Row 5: ナ行 (na-row)
		KanaCharacter(id: "katakana_na", unicode: "ナ", romaji: "na", type: .katakana, row: 5, strokeCount: 2),
		KanaCharacter(id: "katakana_ni", unicode: "ニ", romaji: "ni", type: .katakana, row: 5, strokeCount: 2),
		KanaCharacter(id: "katakana_nu", unicode: "ヌ", romaji: "nu", type: .katakana, row: 5, strokeCount: 2),
		KanaCharacter(id: "katakana_ne", unicode: "ネ", romaji: "ne", type: .katakana, row: 5, strokeCount: 4),
		KanaCharacter(id: "katakana_no", unicode: "ノ", romaji: "no", type: .katakana, row: 5, strokeCount: 1),
		
		// Row 6: ハ行 (ha-row)
		KanaCharacter(id: "katakana_ha", unicode: "ハ", romaji: "ha", type: .katakana, row: 6, strokeCount: 2),
		KanaCharacter(id: "katakana_hi", unicode: "ヒ", romaji: "hi", type: .katakana, row: 6, strokeCount: 2),
		KanaCharacter(id: "katakana_fu", unicode: "フ", romaji: "fu", type: .katakana, row: 6, strokeCount: 1),
		KanaCharacter(id: "katakana_he", unicode: "ヘ", romaji: "he", type: .katakana, row: 6, strokeCount: 1),
		KanaCharacter(id: "katakana_ho", unicode: "ホ", romaji: "ho", type: .katakana, row: 6, strokeCount: 4),
		
		// Row 7: マ行 (ma-row)
		KanaCharacter(id: "katakana_ma", unicode: "マ", romaji: "ma", type: .katakana, row: 7, strokeCount: 2),
		KanaCharacter(id: "katakana_mi", unicode: "ミ", romaji: "mi", type: .katakana, row: 7, strokeCount: 3),
		KanaCharacter(id: "katakana_mu", unicode: "ム", romaji: "mu", type: .katakana, row: 7, strokeCount: 2),
		KanaCharacter(id: "katakana_me", unicode: "メ", romaji: "me", type: .katakana, row: 7, strokeCount: 2),
		KanaCharacter(id: "katakana_mo", unicode: "モ", romaji: "mo", type: .katakana, row: 7, strokeCount: 3),
		
		// Row 8: ヤ行 (ya-row)
		KanaCharacter(id: "katakana_ya", unicode: "ヤ", romaji: "ya", type: .katakana, row: 8, strokeCount: 2),
		KanaCharacter(id: "katakana_yu", unicode: "ユ", romaji: "yu", type: .katakana, row: 8, strokeCount: 2),
		KanaCharacter(id: "katakana_yo", unicode: "ヨ", romaji: "yo", type: .katakana, row: 8, strokeCount: 3),
		
		// Row 9: ラ行 (ra-row)
		KanaCharacter(id: "katakana_ra", unicode: "ラ", romaji: "ra", type: .katakana, row: 9, strokeCount: 2),
		KanaCharacter(id: "katakana_ri", unicode: "リ", romaji: "ri", type: .katakana, row: 9, strokeCount: 2),
		KanaCharacter(id: "katakana_ru", unicode: "ル", romaji: "ru", type: .katakana, row: 9, strokeCount: 2),
		KanaCharacter(id: "katakana_re", unicode: "レ", romaji: "re", type: .katakana, row: 9, strokeCount: 1),
		KanaCharacter(id: "katakana_ro", unicode: "ロ", romaji: "ro", type: .katakana, row: 9, strokeCount: 3),
		
		// Row 10: ワ行 (wa-row)
		KanaCharacter(id: "katakana_wa", unicode: "ワ", romaji: "wa", type: .katakana, row: 10, strokeCount: 2),
		KanaCharacter(id: "katakana_wo", unicode: "ヲ", romaji: "wo", type: .katakana, row: 10, strokeCount: 3),
		KanaCharacter(id: "katakana_n", unicode: "ン", romaji: "n", type: .katakana, row: 10, strokeCount: 2),
	]
	
	/// All kana characters combined
	static var allCharacters: [KanaCharacter] {
		hiraganaCharacters + katakanaCharacters
	}
	
	/// Get characters by type
	static func characters(for type: KanaType) -> [KanaCharacter] {
		switch type {
		case .hiragana:
			return hiraganaCharacters
		case .katakana:
			return katakanaCharacters
		}
	}
	
	/// Get characters by row
	static func characters(row: Int, type: KanaType? = nil) -> [KanaCharacter] {
		let source = type == nil ? allCharacters : characters(for: type!)
		return source.filter { $0.row == row }
	}
	
	/// Create sample CardProgress entries
	static func createSampleProgress(
		hiraganaCount: Int = 10,
		katakanaCount: Int = 5
	) -> [CardProgress] {
		var progressEntries: [CardProgress] = []
		
		// Create progress for hiragana
		for i in 0..<min(hiraganaCount, hiraganaCharacters.count) {
			let progress = CardProgress(characterId: hiraganaCharacters[i].id)
			progress.isNew = false
			progress.repetitions = Int.random(in: 2...5)
			progress.interval = Int.random(in: 3...14)
			progressEntries.append(progress)
		}
		
		// Create progress for katakana
		for i in 0..<min(katakanaCount, katakanaCharacters.count) {
			let progress = CardProgress(characterId: katakanaCharacters[i].id)
			progress.isNew = false
			progress.repetitions = Int.random(in: 1...4)
			progress.interval = Int.random(in: 1...7)
			progressEntries.append(progress)
		}
		
		return progressEntries
	}
	
	/// Populate a ModelContext with mock data
	static func populateContext(
		_ context: ModelContext,
		hiraganaProgressCount: Int = 10,
		katakanaProgressCount: Int = 5,
		includeAllCharacters: Bool = true
	) {
		// Insert characters
		let charactersToInsert = includeAllCharacters ? allCharacters : Array(hiraganaCharacters[0..<10] + katakanaCharacters[0..<10])
		for character in charactersToInsert {
			context.insert(character)
		}
		
		// Insert progress
		for progress in createSampleProgress(hiraganaCount: hiraganaProgressCount, katakanaCount: katakanaProgressCount) {
			context.insert(progress)
		}
		
		// Insert UserSettings
		let settings = UserSettings()
		settings.dailyGoal = 15
		settings.currentStreak = 7
		settings.longestStreak = 12
		context.insert(settings)
		
		try? context.save()
	}
}
