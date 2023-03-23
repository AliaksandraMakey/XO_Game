
import Foundation

enum GameMode {
    case withUser, withComputer, fiveToFive
}

class GameSession {
    static let shared = GameSession()
    
    var gameMode: GameMode?
}

