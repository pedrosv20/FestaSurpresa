//
//  AllCardsViewController.swift
//  FestaSurpresa
//
//  Created by Maria Fernanda Azolin on 27/11/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit
import SpriteKit

class AllCardsViewController: UIViewController {

    
    @IBOutlet weak var showCardButton: UIButton!
    @IBOutlet weak var roundStoryLabel: UILabel!
    @IBOutlet weak var skView: SKView!
    
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = SKScene(fileNamed: "VerticalScene"){
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
        
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
        
        roundStoryLabel.layer.borderColor = UIColor.black.cgColor
        roundStoryLabel.layer.borderWidth = 2.0
        roundStoryLabel.layer.cornerRadius = 20.0
        showCardButton.layer.cornerRadius = 15.0
        
        
    }
    

    @IBAction func didPressShowCardButton(_ sender: Any) {
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "card") as? CardViewController {
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
    
}

