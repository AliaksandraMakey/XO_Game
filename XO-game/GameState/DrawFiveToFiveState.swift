//
//  FiveToFiveInputState.swift
//  XO-game
//
//  Created by aaa on 2023-03-16.
//  Copyright © 2023 plasmon. All rights reserved.
//

import Foundation

public class DrawFiveToFiveState: GameState {
    public func addMark(at position: GameboardPosition) {}
    
    
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
        
        guard let arrayPosition = gameboard?.arrayPositionsForPlayer else {return}
        for (player, positions) in arrayPosition {
            for position in positions {
                    self.gameboardView?.placeMarkView(player.markViewPrototype.copy(), at: position, true)
            }
        }
        self.isCompleted = true
    }
}

