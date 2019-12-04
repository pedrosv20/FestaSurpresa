//
//  WaitingViewController.swift
//  FestaSurpresa
//
//  Created by MCavasin on 03/12/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit
import SpriteKit

class WaitingViewController: UIViewController {

    
    @IBOutlet weak var skView: SKView!
    @IBOutlet weak var novoCirculo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let scene = SKScene(fileNamed: "WaitingRoom"){
            
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }

        // Do any additional setup after loading the view.
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
