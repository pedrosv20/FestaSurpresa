//
//  CardViewController.swift
//  FestaSurpresa
//
//  Created by Maria Fernanda Azolin on 27/11/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit
import SpriteKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var roleTitleLabel: UILabel!
    @IBOutlet weak var hideCardButton: UIButton!
    @IBOutlet weak var cardIcon: UIImageView!
    @IBOutlet weak var skView: SKView!
    
    
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = SKScene(fileNamed: "VerticalScene") {
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
        
        
        
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
        
        hideCardButton.layer.cornerRadius = 15.0
        
        cardView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cardView.alpha = 0.55
        
        cardView.layer.cornerRadius = 15.0
//        cardView.layer.borderWidth = 2
//        cardView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func didPressHideCardButton(_ sender: Any) {
    }
    
    
}

class Colors {
    var gl:CAGradientLayer!

    init() {
        let colorTop = UIColor(red: 217.0 / 255.0, green: 196.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 229.0 / 255.0, green: 188.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0).cgColor

        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}
