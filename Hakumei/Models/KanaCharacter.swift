import Foundation
import SwiftData

@Model
final class KanaCharacter {
    var id: String
    var unicode: String
    var romaji: String
    var type: String // "hiragana" or "katakana"
    var row: Int
    var strokeCount: Int
    var mnemonic: String

    init(id: String, unicode: String, romaji: String, type: String, row: Int, strokeCount: Int, mnemonic: String = "") {
        self.id = id
        self.unicode = unicode
        self.romaji = romaji
        self.type = type
        self.row = row
        self.strokeCount = strokeCount
        self.mnemonic = mnemonic
    }
}
