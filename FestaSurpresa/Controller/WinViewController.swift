//
//  WinViewController.swift
//  FestaSurpresa
//
//  Created by MCavasin on 04/12/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit
import SpriteKit


class WinViewController: UIViewController {

    
    @IBOutlet weak var skView: SKView!
    @IBOutlet weak var roundStoryLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    
    let colorOrganizer = UIColor(red: 212.0 / 255.0, green: 94.0 / 255.0, blue: 94.0 / 255.0, alpha: 1.0)
    let colorPartyPooper = UIColor(red: 105.0 / 255.0, green: 68.0 / 255.0, blue: 200.0 / 255.0, alpha: 1.0)
    let colorClown = UIColor(red: 14.0 / 255.0, green: 55.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
    var winner: String!
    var winScene: WinScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let scene = SKScene(fileNamed: "WinScene"){
            scene.scaleMode = .aspectFill
            winScene = scene as! WinScene
            skView.presentScene(scene)
        }
        self.navigationController?.navigationBar.isHidden = true
        
        
        if winner == "Organizer"{
            self.view.backgroundColor = colorOrganizer
            self.roundStoryLabel.text = "A festa foi muito sucesso biiixo.\nParabéns por conseguirem organizar a festa!!!"
            winScene.setUp(FunnelName: winner)
            
        }else if winner == "Party Pooper"{
            self.view.backgroundColor = colorPartyPooper
            self.roundStoryLabel.text = "A festa pegou fogo, forte abraaaaaço.\nDessa vez vocês arruinaram a festa com maestria!!"
            winScene.setUp(FunnelName: winner)
        }
        roundStoryLabel.layer.borderColor = UIColor.white.cgColor
        roundStoryLabel.layer.borderWidth = 2.0
        roundStoryLabel.layer.cornerRadius = 10.0
        playAgain.alpha = 0.0
        playAgain.layer.cornerRadius = 10.0
        animate()
        
        
    }
    
    @IBAction func playagain(_ sender: Any) {
        print("lenis")
        //reset all things
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
        
    }
    func animate(){
        UIView.animate(withDuration: 4.0){
            
            self.playAgain.alpha = 1.0

        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
