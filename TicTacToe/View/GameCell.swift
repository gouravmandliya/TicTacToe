//
//  GameCell.swift
//  TicTacToe
//
//  Created by Gourav on 23/02/22.
//


import UIKit

class GameCell: UICollectionViewCell {
    
    //MARK:- Properties
    @IBOutlet weak var lblGameText: UILabel?
    
    var isCellUsed: Bool = false
    var player: Player! {
        didSet {
            self.lblGameText?.font = UIFont.systemFont(ofSize: self.lblGameText?.bounds.size.height ?? 0)
            if self.player.playerType == .playerOne {
                self.lblGameText?.text = "X"
                
            } else {
                self.lblGameText?.text = "O"
            }
        }
    }
    
    //MARK:- Methods
    func setupView() {
        self.lblGameText?.layer.borderWidth = 2.0
        self.lblGameText?.text = ""
        self.lblGameText?.layer.borderColor = UIColor.black.cgColor
        self.isCellUsed = false
    }
}
