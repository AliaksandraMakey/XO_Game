//
//  FiveToFiveInputState.swift
//  XO-game
//
//  Created by aaa on 2023-03-16.
//  Copyright © 2023 plasmon. All rights reserved.
//

import Foundation
//игрок в режиме 5 на 5
public class PlayerFromFiveToFiveInputState: GameState {
    
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
    }
    
    
    // сделать доп вью для отрисовки набора этих 5 позиций
    // сделать метод сверки позиций и выявить на доске оставшиеся после сверки элементы.
    // обьявить победителя
    public func addMark(at position: GameboardPosition) {
        //        Log(.playerInput(player: self.player, position: position))
        guard let gameboardView = self.gameboardView else { return }
//              gameboardView.canPlaceMarkView(at: position) else { return }
        self.gameboard?.arrayPositionsForPlayer[self.player, default: []].append(position)
        self.gameboard?.setPlayer(self.player, at: position)
//        self.gameboardView?.placeMarkView(self.markViewPrototype.copy(), at: position, true)
        if self.gameboard!.checkCountOfMarksFromPlayer(self.player, count: 5) {
            self.isCompleted = true
        }
    }
}

