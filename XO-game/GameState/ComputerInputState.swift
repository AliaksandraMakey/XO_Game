

import Foundation

public class ComputerInputState: GameState {
    
    public private(set) var isCompleted = false
    public let player: Player
    private(set) weak var gameViewController: GameViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    
    public let markViewPrototype: MarkView
    
    init(player: Player, markViewPrototype: MarkView,
         gameViewController: GameViewController,
         gameboard: Gameboard,
         gameboardView: GameboardView)
    {
        self.player = player
        self.markViewPrototype = markViewPrototype
        self.gameViewController = gameViewController
        self.gameboard = gameboard
        self.gameboardView = gameboardView
    }
    
    public func begin() {
        switch self.player {
        case .firstUser:
            self.gameViewController?.firstPlayerTurnLabel.isHidden = false
            self.gameViewController?.secondPlayerTurnLabel.isHidden = true
        case .secondUser:
                self.gameViewController?.firstPlayerTurnLabel.isHidden = true
                self.gameViewController?.secondPlayerTurnLabel.isHidden = false
        }
        self.gameViewController?.winnerLabel.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.gameboardView?.onSelectPosition?(self.getRandomAvailablePosition()!)}
    }
    
    public func addMark(at position: GameboardPosition) {
        Log(.playerInput(player: self.player, position: position))
            guard let gameboardView = self.gameboardView,
                  gameboardView.canPlaceMarkView(at: position) else { return }
            self.gameboard?.setPlayer(self.player, at: position)
            self.gameboardView?.placeMarkView(self.markViewPrototype.copy(), at: position)
            self.isCompleted = true
    }
    
    private func getRandomAvailablePosition() -> GameboardPosition? {
        let availablePositions = self.gameboard?.getAvailablePositions()
//TODO: добавить комбинации для улучшения игрока computer
        let randomIndex = Int.random(in: 0..<availablePositions!.count)
        return availablePositions![randomIndex]
    }
}

