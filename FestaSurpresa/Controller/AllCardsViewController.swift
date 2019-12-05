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
    
    @IBOutlet weak var iniciarRodadaButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    var showClicked = false
    var messageSend = false
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
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Inicia Jogo"), object: nil, queue: nil) { (Notification) in
            if SessionHandler.shared.host {
                //botao aparece e começa jogo
            }
        }
        
    }
    
    
    @IBAction func didPressShowCardButton(_ sender: Any) {
        showClicked = true
        //anima negocio
        for i in buttons {
            
            if i.titleLabel!.text! == SessionHandler.shared.carta!.nome {
                UIView.animate(withDuration: 1, animations: {
                    i.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
                }) { (true) in
                    UIView.animate(withDuration: 0.5, animations: {
                        i.transform = .identity
                    })
                }
            }
        }
    
        //TODO:  transformar imagens da allcardsviewcontroller em botoes e quando clicar em cada um, instanciar cards controller passando a carta certa.
        // após isso qunando este botao for clicado, aumentar e deixar do tamanho normao o botao da carta da pessoa
        
    }
    
    @IBAction func cardButton(_ sender: UIButton) {
        
        
        if showClicked == true && sender.titleLabel!.text! == SessionHandler.shared.carta!.nome  && messageSend == false{
            SessionHandler.shared.cardTouched = SessionHandler.shared.carta!
            SessionHandler.shared.sawCard = true
            //manda mensagem pro host de ok
            print("visualizou carta", SessionHandler.shared.mcSession?.connectedPeers.first!.displayName)
            
            let message = "visualizouCarta".data(using: .utf8)
            DispatchQueue.main.async {
                do {
                    try SessionHandler.shared.mcSession?.send(message!, toPeers: [(SessionHandler.shared.mcSession?.connectedPeers.first)!], with: .unreliable)
                    self.messageSend = true
                } catch {
                    print("error sending visualizou message")
                }
            }
            
            
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

