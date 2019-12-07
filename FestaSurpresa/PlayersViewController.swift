//
//  PlayersViewController.swift
//  FestaSurpresa
//
//  Created by Maria Fernanda Azolin on 28/11/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    
    @IBOutlet var playerButton: [UIButton]!
    
    @IBOutlet weak var readyButton: UIButton!
    
    @IBOutlet weak var roundTitleLabel: UILabel!
    
    var selectedPlayersArray = [String] ()
    var selectedPlayers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        readyButton.layer.cornerRadius = 15.0
        
        roundTitleLabel.layer.borderColor = UIColor.black.cgColor
        roundTitleLabel.layer.borderWidth = 1.0
        roundTitleLabel.layer.cornerRadius = 20.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SessionHandler.shared.controller = self
        
        
        for index in 0...playerButton.count-1 {
            playerButton[index].titleLabel!.adjustsFontSizeToFitWidth = true
        }
        
        playerButton[0].setTitle(SessionHandler.shared.nome, for: .normal)
        playerButton[0].isHidden = false
        playerButton[0].isEnabled = true
        
        for index in 0..<(SessionHandler.shared.mcSession?.connectedPeers.count)! {
            playerButton[index+1].setTitle(SessionHandler.shared.mcSession?.connectedPeers[index].displayName, for: .normal)
            playerButton[index+1].isHidden = false
            playerButton[index+1].isEnabled = true
        }
        
    }
    
    
    
    @IBAction func didPressPlayerButton(_ sender: UIButton) {
        if selectedPlayers < 3 {
            
            let contains = selectedPlayersArray.contains(where: { $0 == sender.titleLabel!.text! }) //check if array contains button text, aka if button was already clicked
            if !contains {
                sender.setTitleColor(UIColorFromRGB(rgbValue: 0xFFE677), for: .normal)
                sender.setBackgroundImage(UIImage(named: "ovalBlack"), for: .normal)
                selectedPlayersArray.append(sender.titleLabel!.text!)
                selectedPlayers += 1
            }
            else {
                sender.setTitleColor(UIColorFromRGB(rgbValue: 0x000000), for: .normal)
                sender.setBackgroundImage(UIImage(named: "Oval Copy 10"), for: .normal)
                selectedPlayersArray.remove(at: selectedPlayersArray.firstIndex(of: sender.titleLabel!.text!)!)
                selectedPlayers -= 1
            }
            
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
