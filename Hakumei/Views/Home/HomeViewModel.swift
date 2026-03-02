import Foundation
import Observation

@MainActor @Observable class HomeViewModel {

	var greatingText = ""
	private let timeService: TimeServiceProtocol

	init(timeService: TimeServiceProtocol? = nil) {
		self.timeService = timeService ?? TimeService()
		initialLoad()
	}

	private func initialLoad() {
		updateGreeting()
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

}
