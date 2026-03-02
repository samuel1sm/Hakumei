import Foundation

protocol TimeServiceProtocol {

	func getHour() -> Int
}

class TimeService: TimeServiceProtocol {

	func getHour() -> Int {
		Calendar.current.component(.hour, from: Date())
	}
}

class MockTimeService: TimeServiceProtocol {

	var hour: Int!

	func getHour() -> Int {
		hour
	}
}
