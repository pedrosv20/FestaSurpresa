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
    
    @IBOutlet var buttons: [UIButton]!
    
    var showClicked = false
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
        showClicked = true
        //anima negocio
        for i in buttons {
            
            if i.titleLabel!.text! == SessionHandler.shared.carta!.nome {
                UIView.animate(withDuration: 1, animations: {
                        i.transform = CGAffineTransform(scaleX: 2, y: 2)
                }) { (true) in
                    UIView.animate(withDuration: 0.5, animations: {

                    })
//                let originalFrame = i.frame
//                UIView.animate(withDuration: 3.0, animations: {
//                   i.frame.size.height = i.frame.size.height * 2
//                   i.frame.size.width = i.frame.size.width * 2
//
//                    // adjust the button's x,y coordinates so it appears to stay in place
//                   i.frame.origin.x = i.frame.origin.x - (i.frame.size.width / 4)
//                   i.frame.origin.y = i.frame.origin.y - (i.frame.size.height / 4)
//
//                }) { (Bool) in
//                    UIView.animate(withDuration: 1.0, animations: {
//                        i.frame = originalFrame
//
//                    })
                }
            }
        }
    
        //TODO:  transformar imagens da allcardsviewcontroller em botoes e quando clicar em cada um, instanciar cards controller passando a carta certa.
        // após isso qunando este botao for clicado, aumentar e deixar do tamanho normao o botao da carta da pessoa
        
    }
    
    @IBAction func cardButton(_ sender: UIButton) {
        print(sender.titleLabel!.text)
        
        if showClicked == true && sender.titleLabel!.text == SessionHandler.shared.carta?.nome {
            SessionHandler.shared.cardTouched = SessionHandler.shared.carta!
            SessionHandler.shared.sawCard = true
            //manda mensagem pro host de ok
            self.performSegue(withIdentifier: "showCard", sender: Any?.self)
            return
        }
        for carta in Model.shared.cartas {
            if carta.nome == sender.titleLabel!.text {
                SessionHandler.shared.cardTouched = carta
                self.performSegue(withIdentifier: "showCard", sender: Any?.self)
            }
        }
        
        
    }
    
    
    
    
}

