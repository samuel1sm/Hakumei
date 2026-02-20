import Foundation
import SwiftData

enum KanaType: String, Codable {
    case hiragana
    case katakana
}

@Model
final class KanaCharacter {
    var id: String
    var unicode: String
    var romaji: String
    var type: KanaType
    var row: Int
    var strokeCount: Int
    var mnemonic: String

	init(
		id: String,
		unicode: String,
		romaji: String,
		type: KanaType,
		row: Int,
		strokeCount: Int,
		mnemonic: String = ""
	) {
        self.id = id
        self.unicode = unicode
        self.romaji = romaji
        self.type = type
        self.row = row
        self.strokeCount = strokeCount
        self.mnemonic = mnemonic
    }
}
