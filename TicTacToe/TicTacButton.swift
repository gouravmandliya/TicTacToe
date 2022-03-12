//
//  TicTacButton.swift
//  TicTacToe
//
//  Created by Gourav on 24/02/22.
//

import Foundation
import UIKit

class TicTacButton: UIButton {
    
    // MARK: - Properties
    
    static let placeholderPosition = -1

    private (set) var claimingPlayer: Player?
    
    // MARK: - Instance Methods
    
    func claim(for player: Player) {
        claimingPlayer = player
        setTitle(player.displayString, for: .normal)
    }
    
    func unclaim() {
        claimingPlayer = nil
        setTitle("", for: .normal)
    }
}
