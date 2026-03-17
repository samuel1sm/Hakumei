import Foundation
import Observation
import SwiftData

@MainActor @Observable class HomeViewModel {

	var greatingText = ""
	var hiraganaProgress: Double = 0
	var katakanaProgress: Double = 0

	var hiraganaCountText: String = "0 / 46 characters"
	var katakanaCountText: String = "0 / 46 characters"

	var nextHiraganaRow = "あいうえお"
	var nextKatakanaRow = " アイウエオ"

	private let timeService: TimeServiceProtocol

	init(timeService: TimeServiceProtocol? = nil) {
		self.timeService = timeService ?? TimeService()
	}

	func loadOnAppear(context: ModelContext) {
		updateGreeting()
		loadProgress(context)
	}

	private func updateGreeting() {
		switch timeService.getHour() {
		case 5..<12:
			greatingText = "Good morning"
		case 12..<17:
			greatingText = "Good afternoon"
		case 17..<22:
			greatingText = "Good evening"
		default:
			greatingText = "Good night"
		}
	}

	private func loadProgress(_ context: ModelContext) {
		let progressDescriptor = FetchDescriptor<CardProgress>()
		let kanaDescriptor = FetchDescriptor<KanaCharacter>()
		
		guard let allProgress = try? context.fetch(progressDescriptor),
			  let allKana = try? context.fetch(kanaDescriptor) else {
			return
		}
		
		// Create lookup dictionary for fast access
		let kanaLookup = Dictionary(uniqueKeysWithValues: allKana.map { ($0.id, $0) })

		var hiraganaCount = 0
		var katakanaCount = 0
		
		for progress in allProgress {
			if let character = kanaLookup[progress.characterId] {
				switch character.type {
				case .hiragana:
					hiraganaCount += 1
				case .katakana:
					katakanaCount += 1
				}
			}
		}
		
		hiraganaProgress = Double(hiraganaCount) / Double(46)
		katakanaProgress = Double(katakanaCount) / Double(46)
		hiraganaCountText = "\(hiraganaCount) / 46 characters"
		katakanaCountText = "\(katakanaCount) / 46 characters"

		//Discover next kana learning rows
		var nextRow = (allProgress.filter { kanaLookup[$0.characterId]?.type == .hiragana }.compactMap {
			kanaLookup[$0.characterId]?.row
		}.max() ?? 0) + 1
		nextHiraganaRow = allKana.filter{ $0.row == nextRow && $0.type == .hiragana }.reduce("") { $0 + $1.unicode }

		nextRow = (allProgress.filter { kanaLookup[$0.characterId]?.type == .katakana }.compactMap {
			kanaLookup[$0.characterId]?.row
		}.max() ?? 0) + 1
		nextKatakanaRow = allKana.filter{ $0.row == nextRow && $0.type == .katakana }.reduce("") { $0 + $1.unicode }
	}

}
