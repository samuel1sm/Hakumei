import Foundation
import SwiftData

@Model
final class UserSettings {
    var dailyGoal: Int
    var writingEnabled: Bool
    var audioEnabled: Bool
    var reminderTime: Date?
    var currentStreak: Int
    var longestStreak: Int

    init() {
        self.dailyGoal = 10
        self.writingEnabled = false
        self.audioEnabled = true
        self.reminderTime = nil
        self.currentStreak = 0
        self.longestStreak = 0
    }
}
