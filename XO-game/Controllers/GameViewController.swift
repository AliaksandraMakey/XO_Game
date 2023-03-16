

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var gameboardView: GameboardView!
    @IBOutlet var firstPlayerTurnLabel: UILabel!
    @IBOutlet var secondPlayerTurnLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var restartButton: UIButton!
    
    var gameSession = GameSession.shared
    private var gameboard = Gameboard()
    private var currentState: GameState! {
        didSet {
            self.currentState.begin()
        }
    }
    
    private lazy var referee = Referee(gameboard: self.gameboard)
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.goToFirstState()
        
        gameboardView.onSelectPosition = { [weak self] position in
            guard let self = self else { return }
            self.currentState.addMark(at: position)
            if self.currentState.isCompleted {
                self.goToNextState()
            }
        }
    }
  
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        gameboard.clear()
        self.reloadViewFromNib()
    }
}

extension GameViewController {
    
    private func goToFirstState() {
        let player = Player.firstUser
        self.currentState = FirstPlayerInputState(player: player,
                                             markViewPrototype: player.markViewPrototype,
                                             gameViewController: self,
                                             gameboard: gameboard,
                                             gameboardView: gameboardView)
    }
    
    private func goToNextState() {
        //TODO: перенести логику из контроллера + пофиксить
        if let winner = self.referee.determineWinner() {
            self.currentState = GameEndedState(winner: winner, gameViewController: self)
            return
        }
        if let playerInputState = currentState as? FirstPlayerInputState {
            let player = playerInputState.player.next
            if gameSession.gameMode == .withComputer {
                self.currentState = ComputerInputState(player: player,
                                                       markViewPrototype: player.markViewPrototype,
                                                       gameViewController: self,
                                                       gameboard: gameboard,
                                                       gameboardView: gameboardView)
            } else {
                self.currentState = SecondPlayerInputState(player: player,
                                                           markViewPrototype: player.markViewPrototype,
                                                           gameViewController: self,
                                                           gameboard: gameboard,
                                                           gameboardView: gameboardView)
            }
            return
        }
        if gameSession.gameMode == .withComputer {
            if let computerInputState = currentState as? ComputerInputState {
                let player = computerInputState.player.next
                self.currentState = FirstPlayerInputState(player: player,
                                                          markViewPrototype: player.markViewPrototype,
                                                          gameViewController: self,
                                                          gameboard: gameboard,
                                                          gameboardView: gameboardView)
            }
        } else {
            if let computerInputState = currentState as? SecondPlayerInputState {
                let player = computerInputState.player.next
                self.currentState = FirstPlayerInputState(player: player,
                                                          markViewPrototype: player.markViewPrototype,
                                                          gameViewController: self,
                                                          gameboard: gameboard,
                                                          gameboardView: gameboardView)
            }
            return
        }
    }
}

