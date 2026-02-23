import Testing
@testable import Hakumei

@Suite("SRSEngine — SM-2 Scheduling")
struct SRSEngineTests {

    let engine = SRSEngine()

    // MARK: - Helpers

    func makeProgress(
        characterId: String = "hiragana_a",
        repetitions: Int = 0,
        interval: Int = 1,
        easeFactor: Double = 2.5
    ) -> CardProgress {
        let progress = CardProgress(characterId: characterId)
        progress.repetitions = repetitions
        progress.interval = interval
        progress.easeFactor = easeFactor
        return progress
    }

    // MARK: - First Repetition

    @Test("First correct answer → interval = 1")
    func firstCorrectAnswer() {
        let progress = makeProgress(repetitions: 0)
        let result = engine.calculateNext(quality: .good, for: progress)
        #expect(result.newRepetitions == 1)
        #expect(result.nextInterval == 1)
    }

    // MARK: - Second Repetition

    @Test("Second correct answer → interval = 6")
    func secondCorrectAnswer() {
        let progress = makeProgress(repetitions: 1, interval: 1)
        let result = engine.calculateNext(quality: .good, for: progress)
        #expect(result.newRepetitions == 2)
        #expect(result.nextInterval == 6)
    }

    // MARK: - Subsequent Repetitions

    @Test("Third correct answer → interval = round(previous * easeFactor)")
    func thirdCorrectAnswer() {
        let progress = makeProgress(repetitions: 2, interval: 6, easeFactor: 2.5)
        let result = engine.calculateNext(quality: .good, for: progress)
        let expected = Int((6.0 * 2.5).rounded())  // 15
        #expect(result.newRepetitions == 3)
        #expect(result.nextInterval == expected)
    }

    // MARK: - Failed Answer

    @Test("Hard-but-failing answer resets repetitions and interval")
    func failedAnswerResetsProgress() {
        let progress = makeProgress(repetitions: 3, interval: 15, easeFactor: 2.5)
        let result = engine.calculateNext(quality: .incorrectEasy, for: progress)
        #expect(result.newRepetitions == 0)
        #expect(result.nextInterval == 1)
        // Ease factor is unchanged on failure
        #expect(result.newEaseFactor == 2.5)
    }

    @Test("Blackout resets repetitions and interval")
    func blackoutResetsProgress() {
        let progress = makeProgress(repetitions: 5, interval: 21, easeFactor: 2.5)
        let result = engine.calculateNext(quality: .blackout, for: progress)
        #expect(result.newRepetitions == 0)
        #expect(result.nextInterval == 1)
    }

    // MARK: - Ease Factor

    @Test("Perfect answer increases ease factor")
    func perfectAnswerIncreasesEase() {
        let progress = makeProgress(repetitions: 2, interval: 6, easeFactor: 2.5)
        let result = engine.calculateNext(quality: .perfect, for: progress)
        #expect(result.newEaseFactor > 2.5)
    }

    @Test("Hard answer decreases ease factor")
    func hardAnswerDecreasesEase() {
        let progress = makeProgress(repetitions: 2, interval: 6, easeFactor: 2.5)
        let result = engine.calculateNext(quality: .hard, for: progress)
        #expect(result.newEaseFactor < 2.5)
    }

    @Test("Ease factor never drops below minimum (1.3)")
    func easeFactorFloor() {
        let progress = makeProgress(repetitions: 2, interval: 6, easeFactor: 1.3)
        let result = engine.calculateNext(quality: .hard, for: progress)
        #expect(result.newEaseFactor >= SRSEngine.minimumEaseFactor)
    }

    // MARK: - Maturity

    @Test("Card is not mature below interval threshold")
    func cardNotMatureBeforeThreshold() {
        let progress = makeProgress(repetitions: 4, interval: 20)
        let result = engine.calculateNext(quality: .perfect, for: progress)
        // reps becomes 5 but interval is still under 21 days
        #expect(result.isMature == false)
    }

    @Test("Card becomes mature at reps >= 5 and interval >= 21")
    func cardMatureAboveThreshold() {
        // interval=10, ef=2.5 → next interval = 25
        let progress = makeProgress(repetitions: 4, interval: 10, easeFactor: 2.5)
        let result = engine.calculateNext(quality: .perfect, for: progress)
        #expect(result.newRepetitions == 5)
        #expect(result.nextInterval >= SRSEngine.matureIntervalThreshold)
        #expect(result.isMature == true)
    }

    // MARK: - ReviewQuality.passed

    @Test("Quality .hard and above is considered passing")
    func passingThreshold() {
        #expect(ReviewQuality.hard.passed == true)
        #expect(ReviewQuality.good.passed == true)
        #expect(ReviewQuality.perfect.passed == true)
        #expect(ReviewQuality.incorrectEasy.passed == false)
        #expect(ReviewQuality.incorrect.passed == false)
        #expect(ReviewQuality.blackout.passed == false)
    }

    // MARK: - Apply

    @Test("apply(_:to:) updates CardProgress fields")
    func applyUpdatesProgress() {
        let progress = makeProgress(repetitions: 1, interval: 1, easeFactor: 2.5)
        let result = engine.calculateNext(quality: .good, for: progress)
        engine.apply(result, to: progress)

        #expect(progress.repetitions == result.newRepetitions)
        #expect(progress.interval == result.nextInterval)
        #expect(progress.easeFactor == result.newEaseFactor)
        #expect(progress.isNew == false)
        #expect(progress.consecutiveCorrectCount == 1)
        #expect(progress.firstCorrectDate != nil)
    }

    @Test("apply(_:to:) resets streak on failure")
    func applyResetsStreakOnFailure() {
        let progress = makeProgress(repetitions: 3, interval: 15, easeFactor: 2.5)
        progress.consecutiveCorrectCount = 3
        let result = engine.calculateNext(quality: .incorrect, for: progress)
        engine.apply(result, to: progress)
        #expect(progress.consecutiveCorrectCount == 0)
    }
}
