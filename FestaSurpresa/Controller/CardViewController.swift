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
    

    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var roleTitleLabel: UILabel!
    @IBOutlet weak var hideCardButton: UIButton!
    @IBOutlet weak var cardIcon: UIImageView!
    @IBOutlet weak var skView: SKView!
    
    @IBOutlet weak var poder: UILabel!
    @IBOutlet weak var descricao: UILabel!
    
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
        
//        blurView.effect.
//
//        cardView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        cardView.alpha = 0
        
        
        blurView.layer.cornerRadius = 15.0
        blurView.alpha = 0.6
//        cardView.layer.borderWidth = 2
//        cardView.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SessionHandler.shared.controller = self
        roleTitleLabel.text = SessionHandler.shared.cardTouched!.nome
        descricao.text = SessionHandler.shared.cardTouched!.descricao
        poder.text = SessionHandler.shared.cardTouched!.poder
        cardIcon.image = SessionHandler.shared.cardTouched!.icone
    }
    @IBAction func didPressHideCardButton(_ sender: Any) {
        if SessionHandler.shared.sawCard == true {
            //TODO: manda mensagfem de ok
        }
        self.dismiss(animated: false, completion: nil)
//        print(Model.shared.players.first?.carta?.nome)
//        print(Model.shared.players.count)
//        for i in Model.shared.players {
//            print(i.nome)
//        }
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
