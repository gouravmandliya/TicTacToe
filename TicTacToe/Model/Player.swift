//
//  Player.swift
//  TicTacToe
//
//  Created by Gourav on 23/02/22.
//

import Foundation

enum PlayerType: String {
    case playerOne = "Player X"
    case playerTwo = "Player O"
}

struct Player {
    var playerType: PlayerType
    var playerMoves: [UInt]
    var isPlayerTurn: Bool
    var isPlayerWin: Bool = false
}
