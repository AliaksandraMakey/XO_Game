

import Foundation

// MARK: - Invoker
internal final class LoggerInvoker {
    // MARK: Singleton
    internal static let shared = LoggerInvoker()
    // MARK: Private properties
    private let logger = LoggerReceiver()
    private let batchSize = 10
    private var commands: [LoggerCommand] = []
    // MARK: Internal
    internal func addLoggerCommand(_ command: LoggerCommand) {
        self.commands.append(command)
        self.executeCommandsIfNeeded()
    }
    // MARK: Private
    private func executeCommandsIfNeeded() {
        guard self.commands.count >= batchSize else { return }
        self.commands.forEach {
            self.logger.writeMessageToLog($0.logMessage)
        }
        self.commands = []
    }
}
