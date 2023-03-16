////
////  GameboardViewComputer.swift
////  XO-game
////
////  Created by aaa on 2023-03-16.
////  Copyright © 2023 plasmon. All rights reserved.
////
//
//import UIKit
//
//public class GameboardViewComputer: GameboardView {
//    public override func draw(_ rect: CGRect) {
//        super.draw(rect)
//        Constants.lineColorGreen.setStroke()
//        drawColumnLines(for: rect)
//        drawRowLines(for: rect)
//        determineComputerMovePosition()
//    }
//
//    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {}
//
//    func determineComputerMovePosition(){
//        let movePosition = GameboardPosition(column: (Int.random(in: 0...2)), row: (Int.random(in: 0...2)))
//        onSelectPosition?(movePosition)
//    }
//
//
//}
//
//
////    func isSquareOccupied(in moves: [Move?], position: GameboardPosition) -> Bool {
////       return moves.contains(where: { $0?.boardPosition == position})
////    }
////
////    func determineComputerMovePosition(in moves: [Move?]) -> GameboardPosition {
////       var movePosition = GameboardPosition(column: (Int.random(in: 0...2)), row: (Int.random(in: 0...2)))
////
////        while isSquareOccupied(in: moves, position: movePosition) {
////            movePosition = GameboardPosition(column: (Int.random(in: 0...2)), row: (Int.random(in: 0...2)))
////        }
////       return movePosition
////    }
