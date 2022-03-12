//
//  GameContracts.swift
//  TicTacToe
//
//  Created by Gourav on 23/02/22.
//

import Foundation

enum GameResult {
    case tie
    case win
}

protocol GameVMProtocol {
    var delegate: GameVMOutputDelegate? { get set }
    func checkScore(move: UInt) -> (player: Player, nextTurn: String)
    func resetGame()
}

protocol GameVMOutputDelegate {
    func gameResult(player: Player?, result: GameResult)
    func startNewGame()
}
