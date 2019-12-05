//
//  AllCardsViewController.swift
//  FestaSurpresa
//
//  Created by Maria Fernanda Azolin on 27/11/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit

class AllCardsViewController: UIViewController {
    
    
    @IBOutlet weak var showCardButton: UIButton!
    @IBOutlet weak var roundStoryLabel: UILabel!
    
    @IBOutlet weak var iniciarRodadaButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    var showClicked = false
    var messageSend = false
    var hostSend = false
    let colors = Colors()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
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
                print("era pra ter começado")
                print(Model.shared.players[SessionHandler.shared.rodada].peerID)
                if SessionHandler.shared.rodada == 0 {
                    SessionHandler.shared.lider = true
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: NSNotification.Name("inicia lider"), object: nil)
                    }
                    return
                    
                }
                SessionHandler.shared.sendMessage(messageToSend: "lider", convidado: Model.shared.players[SessionHandler.shared.rodada].peerID)
                // decide lider e enviar mensagem pra aparecer botao
            }
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "inicia lider"), object: nil, queue: nil) { (Notification) in
            if SessionHandler.shared.lider {
                // instancia view lider
                self.iniciarRodadaButton.isHidden = false
                self.iniciarRodadaButton.isEnabled = true
                print("voce é o lider")
                let storyboard = UIStoryboard(name: "Players", bundle: nil)
                let controller  = storyboard.instantiateInitialViewController()!
                controller.modalPresentationStyle = .overCurrentContext
                self.present(controller, animated: false, completion: nil)
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
        if SessionHandler.shared.host {
            SessionHandler.shared.cardTouched = SessionHandler.shared.carta!
            SessionHandler.shared.sawCard = true
            
            if showClicked == true && sender.titleLabel!.text! == SessionHandler.shared.carta!.nome &&  hostSend == false{
                SessionHandler.shared.playersConfirmed += 1
                hostSend = true
                if (SessionHandler.shared.mcSession?.connectedPeers.count)! + 1 == SessionHandler.shared.playersConfirmed {
                    NotificationCenter.default.post(Notification(name: Notification.Name("Inicia Jogo")))
                }
            }
            self.performSegue(withIdentifier: "showCard", sender: Any?.self)
            return
        }
        
        if showClicked == true && sender.titleLabel!.text! == SessionHandler.shared.carta!.nome  && messageSend == false{
            
            SessionHandler.shared.cardTouched = SessionHandler.shared.carta!
            SessionHandler.shared.sawCard = true
            //manda mensagem pro host de ok
            print("visualizou carta", SessionHandler.shared.mcSession?.connectedPeers.first!.displayName)
            
            let message = "visualizou carta".data(using: .utf8)
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

