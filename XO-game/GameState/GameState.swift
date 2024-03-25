

import Foundation

public protocol GameState {
    var isCompleted: Bool { get }
    func begin()
    func addMark(at position: GameboardPosition)
}
