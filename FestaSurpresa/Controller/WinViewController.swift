//
//  WinViewController.swift
//  FestaSurpresa
//
//  Created by MCavasin on 04/12/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation


class WinViewController: UIViewController {

    
    @IBOutlet weak var skView: SKView!
    @IBOutlet weak var roundStoryLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    var player: AVAudioPlayer?
    
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
            playSoundBem()
            self.view.backgroundColor = colorOrganizer
            self.roundStoryLabel.text = "A festa foi muito sucesso biiixo.\nParabéns por conseguirem organizar a festa!!!"
            winScene.setUp(FunnelName: winner)
            
        }else if winner == "Party Pooper"{
            playSoundMal()
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
    

    func playSoundBem() {
        guard let url = Bundle.main.url(forResource: "bem", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playSoundMal() {
        guard let url = Bundle.main.url(forResource: "mal", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

}
