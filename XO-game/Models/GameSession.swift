
import Foundation

enum GameMode {
    case withUser, withComputer, fiveToFive
}

class GameSession {
    static let shared = GameSession()
    
    var boardPosition: [GameboardPosition?]
    var gameMode: GameMode?
    
    private init() {
        self.boardPosition = []
    }
}

