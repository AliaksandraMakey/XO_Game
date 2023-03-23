

import Foundation

public final class Gameboard {
    
    // MARK: - Properties
    
    lazy var positions: [[Player?]] = initialPositions()
    var arrayPositionsForPlayer = [Player: [GameboardPosition]]()
    
    // MARK: - public
    
    public func setPlayer(_ player: Player, at position: GameboardPosition) {
            positions[position.column][position.row] = player
    }
    
    public func clear() {
        self.positions = initialPositions()
        
    }
    
    public func contains(player: Player, at positions: [GameboardPosition]) -> Bool {
        for position in positions {
            guard contains(player: player, at: position) else {
                return false
            }
        }
        return true
    }
    
    public func contains(player: Player, at position: GameboardPosition) -> Bool {
        let (column, row) = (position.column, position.row)
        return positions[column][row] == player
    }
    // проверить, есть ли количество меток от этого пользователя
    func checkCountOfMarksFromPlayer(_ checkPlayer: Player, count: Int) -> Bool {
        return count <= self.arrayPositionsForPlayer[checkPlayer]?.count ?? 0
    }
    // MARK: - Private
    private func initialPositions() -> [[Player?]] {
        var positions: [[Player?]] = []
        for _ in 0 ..< GameboardSize.columns {
            let rows = Array<Player?>(repeating: nil, count: GameboardSize.rows)
            positions.append(rows)
        }
        return positions
    }
    
    public func getAvailablePositions() -> [GameboardPosition] {
        var availablePositions: [GameboardPosition] = []

        for (columnIndex, column) in positions.enumerated() {
            for (rowIndex, player) in column.enumerated() {
                if player == nil {
                    let availablePosition = GameboardPosition(column: columnIndex, row: rowIndex)
                    availablePositions.append(availablePosition)
                }
            }
        }

        return availablePositions
    }
}
