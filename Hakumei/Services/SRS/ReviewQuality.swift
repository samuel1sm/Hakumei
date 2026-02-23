enum ReviewQuality: Int {

    case blackout = 0
    case incorrect = 1
    case incorrectEasy = 2
    case hard = 3
    case good = 4
    case perfect = 5

    var passed: Bool { rawValue >= 3 }
}
