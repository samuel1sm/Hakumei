import Foundation

struct SRSEngine {

    // MARK: - Constants

    static let matureRepetitionThreshold = 5
    static let matureIntervalThreshold = 21  // days
    static let minimumEaseFactor = 1.3

    private let firstInterval = 1
    private let secondInterval = 6
    private let easeFactorBaseBonus = 0.1
    private let easeFactorLinearPenalty = 0.08
    private let easeFactorQuadraticPenalty = 0.02

    // MARK: - SM-2 Core

    /// Calculates the next review schedule for a card.
    /// - Parameters:
    ///   - quality: Answer quality 0–5 (0–2 = failed, 3–5 = passed)
    ///   - progress: The current `CardProgress` record
    /// - Returns: A new `SRSResult` with updated scheduling values
    func calculateNext(quality: ReviewQuality, for progress: CardProgress) -> SRSResult {
        let newRepetitions: Int
        let newInterval: Int
        let newEaseFactor: Double

		if quality.passed {
            newRepetitions = progress.repetitions + 1

            switch progress.repetitions {
            case 0:
                newInterval = firstInterval
            case 1:
                newInterval = secondInterval
            default:
                newInterval = max(firstInterval, Int((Double(progress.interval) * progress.easeFactor).rounded()))
            }

			// SM-2 ease factor update
			let q = Double(quality.rawValue)
			let maxQ = Double(ReviewQuality.perfect.rawValue)
            let delta = easeFactorBaseBonus - Double(maxQ - q) * (easeFactorLinearPenalty + Double(maxQ - q) * easeFactorQuadraticPenalty)
            newEaseFactor = max(Self.minimumEaseFactor, progress.easeFactor + delta)
        } else {
            // Failed — reset repetitions and interval; ease factor unchanged
            newRepetitions = 0
            newInterval = firstInterval
            newEaseFactor = progress.easeFactor
        }

        let nextReviewDate = Calendar.current.date(
            byAdding: .day,
            value: newInterval,
            to: .now
        ) ?? .now

        let isMature = newRepetitions >= Self.matureRepetitionThreshold
                    && newInterval >= Self.matureIntervalThreshold

        return SRSResult(
            nextInterval: newInterval,
            newEaseFactor: newEaseFactor,
            newRepetitions: newRepetitions,
            nextReviewDate: nextReviewDate,
            isMature: isMature
        )
    }

    // MARK: - Apply

    /// Applies an `SRSResult` back onto a `CardProgress` object.
    func apply(_ result: SRSResult, to progress: CardProgress) {
        progress.interval = result.nextInterval
        progress.easeFactor = result.newEaseFactor
        progress.repetitions = result.newRepetitions
        progress.nextReviewDate = result.nextReviewDate
        progress.isMature = result.isMature
        progress.isNew = false

        if result.newRepetitions > 0 {
            progress.consecutiveCorrectCount += 1
            if progress.firstCorrectDate == nil {
                progress.firstCorrectDate = .now
            }
        } else {
            progress.consecutiveCorrectCount = 0
        }
    }
}
