import SwiftData
import Foundation

@Model
final class CardProgress {
	var characterId: String
	var interval: Int          // days until next review
	var easeFactor: Double     // starts at 2.5
	var repetitions: Int       // consecutive correct answers
	var nextReviewDate: Date
	var isNew: Bool
	var isMature: Bool

	// For mature threshold tracking
	var consecutiveCorrectCount: Int
	var firstCorrectDate: Date?

	// Review direction
	var reviewType: ReviewType  // .recognition or .recall

	init(characterId: String) {
		self.characterId = characterId
		self.interval = 1
		self.easeFactor = 2.5
		self.repetitions = 0
		self.nextReviewDate = .now
		self.isNew = true
		self.isMature = false
		self.consecutiveCorrectCount = 0
		self.reviewType = .characterToRomaji
	}
}

enum ReviewType: String, Codable {

	case characterToRomaji
	case romajiToCharacter
}	
