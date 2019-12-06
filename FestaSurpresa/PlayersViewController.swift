//
//  PlayersViewController.swift
//  FestaSurpresa
//
//  Created by Maria Fernanda Azolin on 28/11/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    
    @IBOutlet weak var player1Button: UIButton!
    @IBOutlet weak var player2Button: UIButton!
    @IBOutlet weak var player3Button: UIButton!
    @IBOutlet weak var player4Button: UIButton!
    @IBOutlet weak var player5Button: UIButton!
    @IBOutlet weak var player6Button: UIButton!
    @IBOutlet weak var player7Button: UIButton!
    @IBOutlet weak var player8Button: UIButton!
    
    @IBOutlet weak var readyButton: UIButton!
    
    @IBOutlet weak var roundTitleLabel: UILabel!
    
    var selectedPlayers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1Button.titleLabel!.adjustsFontSizeToFitWidth = true
        player2Button.titleLabel!.adjustsFontSizeToFitWidth = true
        player3Button.titleLabel!.adjustsFontSizeToFitWidth = true
        player4Button.titleLabel!.adjustsFontSizeToFitWidth = true
        player5Button.titleLabel!.adjustsFontSizeToFitWidth = true
        player6Button.titleLabel!.adjustsFontSizeToFitWidth = true
        player7Button.titleLabel!.adjustsFontSizeToFitWidth = true
        player8Button.titleLabel!.adjustsFontSizeToFitWidth = true
        
        player1Button.titleLabel?.text = SessionHandler.shared.nome
        player2Button.titleLabel?.text = SessionHandler.shared.mcSession?.connectedPeers[0].displayName
        
        readyButton.layer.cornerRadius = 15.0
        
        roundTitleLabel.layer.borderColor = UIColor.black.cgColor
        roundTitleLabel.layer.borderWidth = 1.0
        roundTitleLabel.layer.cornerRadius = 20.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SessionHandler.shared.controller = self
    }
    
    
    @IBAction func didPressPlayer1Button(_ sender: Any) {
        if selectedPlayers < 3 {
            player1Button.setTitleColor(UIColorFromRGB(rgbValue: 0xFFE677), for: .normal)
            player1Button.setBackgroundImage(UIImage(named: "ovalBlack"), for: .normal)
            selectedPlayers += 1
        }
    }
    
    @IBAction func didPressPlayer2Button(_ sender: Any) {
        if selectedPlayers < 3 {
            player2Button.setTitleColor(UIColorFromRGB(rgbValue: 0xFFE677), for: .normal)
            player2Button.setBackgroundImage(UIImage(named: "ovalBlack"), for: .normal)
            selectedPlayers += 1
        }
    }
    
    @IBAction func didPressPlayer3Button(_ sender: Any) {
        if selectedPlayers < 3 {
            player3Button.setTitleColor(UIColorFromRGB(rgbValue: 0xFFE677), for: .normal)
            player3Button.setBackgroundImage(UIImage(named: "ovalBlack"), for: .normal)
            selectedPlayers += 1
        }
    }
    
    @IBAction func didPressPlayer4Button(_ sender: Any) {
        if selectedPlayers < 3 {
            player4Button.setTitleColor(UIColorFromRGB(rgbValue: 0xFFE677), for: .normal)
            player4Button.setBackgroundImage(UIImage(named: "ovalBlack"), for: .normal)
            selectedPlayers += 1
        }
    }
    
    
    @IBAction func didPressPlayer5Button(_ sender: Any) {
        if selectedPlayers < 3 {
            player5Button.setTitleColor(UIColorFromRGB(rgbValue: 0xFFE677), for: .normal)
            player5Button.setBackgroundImage(UIImage(named: "ovalBlack"), for: .normal)
            selectedPlayers += 1
        }
    }
    
    
    @IBAction func didPressPlayer6Button(_ sender: Any) {
        if selectedPlayers < 3 {
            player6Button.setTitleColor(UIColorFromRGB(rgbValue: 0xFFE677), for: .normal)
            player6Button.setBackgroundImage(UIImage(named: "ovalBlack"), for: .normal)
            selectedPlayers += 1
        }
    }
    
    
    @IBAction func didPressPlayer7Button(_ sender: Any) {
        if selectedPlayers < 3 {
            player7Button.setTitleColor(UIColorFromRGB(rgbValue: 0xFFE677), for: .normal)
            player7Button.setBackgroundImage(UIImage(named: "ovalBlack"), for: .normal)
            selectedPlayers += 1
        }
    }
    
    @IBAction func didPressPlayer8Button(_ sender: Any) {
        if selectedPlayers < 3 {
            player8Button.setTitleColor(UIColorFromRGB(rgbValue: 0xFFE677), for: .normal)
            player8Button.setBackgroundImage(UIImage(named: "ovalBlack"), for: .normal)
            selectedPlayers += 1
        }
    }
    
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
