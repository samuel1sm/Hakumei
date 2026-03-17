import Foundation
import Observation
import SwiftData

@MainActor @Observable class HomeViewModel {

	var model: HomeModel?

	private let timeService: TimeServiceProtocol

	init(timeService: TimeServiceProtocol? = nil) {
		self.timeService = timeService ?? TimeService()
	}

	func loadOnAppear(context: ModelContext) {
		guard let (allProgress, allKana) = fetchProgressData(from: context) else { return }
		model = HomeModel(
			allProgress: allProgress,
			allKana: allKana,
			hour: timeService.getHour()
		)
	}

	private func fetchProgressData(from context: ModelContext) -> ([CardProgress], [KanaCharacter])? {
		let progressDescriptor = FetchDescriptor<CardProgress>()
		let kanaDescriptor = FetchDescriptor<KanaCharacter>()

		guard let allProgress = try? context.fetch(progressDescriptor),
			  let allKana = try? context.fetch(kanaDescriptor) else {
			return nil
		}

		return (allProgress, allKana)
	}
}
