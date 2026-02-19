import Foundation
import SwiftData

@Model
final class UserProgress {
    var characterId: String
    var easeFactor: Double
    var interval: Int // days until next review
    var repetitions: Int
    var nextReviewDate: Date
    var correctStreak: Int

    init(characterId: String) {
        self.characterId = characterId
        self.easeFactor = 2.5
        self.interval = 1
        self.repetitions = 0
        self.nextReviewDate = Date()
        self.correctStreak = 0
    }
}
