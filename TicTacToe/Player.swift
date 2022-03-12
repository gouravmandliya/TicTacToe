//
//  Player.swift
//  tictactoe
//
//  Created by Gourav on 24/02/22.
//

import Foundation

enum Player {
    case x
    case o
    
    var displayString: String {
        switch self {
        case .x:
            return "X"
            
        case .o:
            return "O"
        }
    }
}
