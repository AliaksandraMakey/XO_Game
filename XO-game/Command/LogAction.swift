

import Foundation

public enum LogAction {
    
    case playerInput(player: Player, position: GameboardPosition)
    case gameFinished(winner: Player?)
    case restartGame
    public func Log(_ action: LogAction) {
        let command = LoggerCommand(action: action)
        LoggerInvoker.shared.addLoggerCommand(command)
    }
}
