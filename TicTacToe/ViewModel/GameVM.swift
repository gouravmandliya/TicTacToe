//
//  GameVM.swift
//  TicTacToe
//
//  Created by Gourav on 23/02/22.
//

import Foundation

class GameVM: GameVMProtocol {

    //MARK:- Properties
    var delegate: GameVMOutputDelegate?
    private var player1 = Player(playerType: .playerOne, playerMoves: [], isPlayerTurn: true)
    private var player2 = Player(playerType: .playerTwo, playerMoves: [], isPlayerTurn: false)
    private var totalMoves: Int = 0
    private let winningPaths: Set<Set<UInt>> = [[0,1,2],
                                               [3,4,5],
                                               [6,7,8],
                                               [0,3,6],
                                               [1,4,7],
                                               [2,5,8],
                                               [0,4,8],
                                               [2,4,6]]
    
    
    //MARK:- GameVMProtocol Methods
    func checkScore(move: UInt) -> (player: Player, nextTurn: String) {
        
        if self.player1.isPlayerTurn {
            self.totalMoves += 1
            self.player1.playerMoves.append(move)
            self.player1.isPlayerTurn = false
            
            if self.calculateScore(player: player1) {
                self.player1.isPlayerWin = true
                self.delegate?.gameResult(player: player1, result: .win)
            }
            return (self.player1, self.player2.playerType.rawValue)
            
        } else {
            self.totalMoves += 1
            self.player2.playerMoves.append(move)
            self.player1.isPlayerTurn = true
        
            if self.calculateScore(player: player2) {
                self.player2.isPlayerWin = true
                self.delegate?.gameResult(player: player2, result: .win)
            }
            return (self.player2, self.player1.playerType.rawValue)
        }
    }
    
    func resetGame() {
        self.player1.playerMoves = []
        self.player1.isPlayerTurn = true
        self.player2.playerMoves = []
        self.player2.isPlayerTurn = false
        self.totalMoves = 0
        self.delegate?.startNewGame()
    }
    
    private func calculateScore(player: Player) -> Bool {
        if self.totalMoves == 9 {
            self.delegate?.gameResult(player: nil, result: .tie)
            return false
        }
        
        let playerMoves = Set(player.playerMoves.compactMap { $0 })
        
        for pattern in self.winningPaths where pattern.isSubset(of: playerMoves) {
            return true
        }
        return false
    }
}
