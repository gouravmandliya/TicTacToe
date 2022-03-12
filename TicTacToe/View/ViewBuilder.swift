//
//  ViewBuilder.swift
//  TicTacToe
//
//  Created by Gourav on 23/02/22.
//

import UIKit

class ViewBuilder {

    static func getGameVC()-> GameVC {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "GameVC") as! GameVC
        viewController.vm = GameVM()
        return viewController
    }
}
