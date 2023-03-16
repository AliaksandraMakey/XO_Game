

import Foundation

// MARK: - Command
final class LoggerCommand {
    let action: LogAction
    init(action: LogAction) {
        self.action = action
    }
    var logMessage: String {
        switch self.action {
        case .playerInput(let player, let position):
            return "\(player) placed mark at \(position)"
        case .gameFinished(let winner):
            if let winner = winner {
                return "\(winner) win game"
            } else {
                return "game finished with no winner"
            }
        case .restartGame:
            return "game restarted"
        }
    }
}

public func Log(_ action: LogAction) {
    let command = LoggerCommand(action: action)
    LoggerInvoker.shared.addLoggerCommand(command)
}
