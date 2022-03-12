//
//  GameVC.swift
//  TicTacToe
//
//  Created by Gourav on 23/02/22.
//

import UIKit

class GameVC: UIViewController {
    
    //MARK:- Properties
    @IBOutlet weak var collectionViewGame: UICollectionView?
    @IBOutlet weak var lblPlayer: UILabel?
    
    private let flowLayout = UICollectionViewFlowLayout()

    private let gameCell = "gameCell"
    private let grid = 9
    
    var vm : GameVM! {
        didSet {
            vm.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    //MARK:- Methods
    private func setupViews() {
        navigationItem.title = "Tic Tac Toe"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(reloadGame))
        self.collectionViewGame?.dataSource = self
        self.collectionViewGame?.delegate = self
        self.collectionViewGame?.collectionViewLayout = flowLayout
    }
    
    @objc private func reloadGame() {
        self.vm.resetGame()
    }
}

//MARK:- UICollectionViewDelegate
extension GameVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
            guard let cell = collectionView.cellForItem(at: indexPath) as? GameCell else { return }
        
            if !cell.isCellUsed {
                let result = self.vm.checkScore(move: UInt(indexPath.row))
                cell.player = result.player
                self.lblPlayer?.text = result.nextTurn
                cell.isCellUsed = true
            }
    }
}

//MARK:- UICollectionViewDelegateFlowLayout
extension GameVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 10) / 3
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}

//MARK:- UICollectionViewDataSource
extension GameVC:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gameCell, for: indexPath) as? GameCell else { return UICollectionViewCell() }
        cell.setupView()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return grid
    }
}

//MARK:- GameVMOutputDelegate
extension GameVC: GameVMOutputDelegate {
    
    func startNewGame() {
        self.lblPlayer?.text = "Player X"
        self.collectionViewGame?.reloadData()
    }
    
    func gameResult(player: Player?, result: GameResult) {
        switch result {
        case .win:
            if let player = player {
                self.showAlertViewWith(message: "\(player.playerType.rawValue) is Win")
            }
        case .tie:
            self.showAlertViewWith(message: "Game is tie")
        }
    }
    
    private func showAlertViewWith(message: String) {
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
            self.reloadGame()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
