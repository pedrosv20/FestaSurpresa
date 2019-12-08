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
    var hostSend = false
    var requestHelpPopUp: RequestHelpPopUp!
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
        iniciarRodadaButton.layer.cornerRadius = 15.0
        roundStoryLabel.layer.borderWidth = 2.0
        roundStoryLabel.layer.cornerRadius = 20.0
        showCardButton.layer.cornerRadius = 15.0
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Inicia Jogo"), object: nil, queue: nil) { (Notification) in
            
            if SessionHandler.shared.host {
                if SessionHandler.shared.rodada == 0 {
                
                
                    SessionHandler.shared.lider = true
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: NSNotification.Name("inicia lider"), object: nil)
                    }
                    return
                    
                }
               
                // decide lider e enviar mensagem pra aparecer botao
                if SessionHandler.shared.rodada >= Model.shared.players.count {
                    SessionHandler.shared.rodada = 0
                }
                 SessionHandler.shared.sendMessage(messageToSend: "lider", convidado: Model.shared.players[SessionHandler.shared.rodada].peerID)
                
            }
             
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "inicia lider"), object: nil, queue: nil) { (Notification) in
            if SessionHandler.shared.lider {
                // instancia view lider
                SessionHandler.shared.lider = true
                self.iniciarRodadaButton.isHidden = false
                self.iniciarRodadaButton.isEnabled = true
                print("voce é o lider")
            }
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "comecando rodada"), object: nil, queue: nil) { (Notification) in
            
            let storyboard = UIStoryboard(name: "RequestHelpPopUp", bundle: nil)
            let controller  = storyboard.instantiateInitialViewController()!
            controller.modalPresentationStyle = .overFullScreen
            self.present(controller, animated: false, completion: nil)
            
        }
        
        //Notification observer fim missao (selecionar novo lider, muda SessionHandler.shared.rodada e envia notificacao Inicia jogo) "deixou de ser lider"
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "fim  rodada"), object: nil, queue: nil) { (Notification) in
            DispatchQueue.main.async {
                // notifica host q acabou
                SessionHandler.shared.sendMessage(messageToSend: "deixou de ser lider", convidado: Model.shared.players[SessionHandler.shared.rodada].peerID)
                if SessionHandler.shared.rodadasArray[SessionHandler.shared.rodada].sucesso == 3 {
                    // tela de vitoria dos cornos
                    let storyboard = UIStoryboard(name: "Win", bundle: nil)
                    let controller  = storyboard.instantiateInitialViewController()!
                    controller.modalPresentationStyle = .overFullScreen
                    self.present(controller, animated: false, completion: {NotificationCenter.default.post(name: NSNotification.Name("Organizer"), object: nil)})
                    
                    
                }
                else if SessionHandler.shared.rodadasArray[SessionHandler.shared.rodada].fracasso == 3 {
                    //tela derrota
                    let storyboard = UIStoryboard(name: "Win", bundle: nil)
                    let controller  = storyboard.instantiateInitialViewController()!
                    controller.modalPresentationStyle = .overFullScreen
                    self.present(controller, animated: false, completion: {NotificationCenter.default.post(name: NSNotification.Name("PartyPooper"), object: nil)})
                }
                SessionHandler.shared.rodada += 1
                SessionHandler.shared.lider = false
                SessionHandler.shared.pessoasNaMissao = 0
                self.iniciarRodadaButton.isHidden = true
                self.iniciarRodadaButton.isEnabled = false
                
                // aparece tela de fim de rodada e volta pra ca
                
                
                
                if SessionHandler.shared.host {
                    NotificationCenter.default.post(name: NSNotification.Name("Inicia Jogo"), object: nil)
                } else {
                    SessionHandler.shared.sendMessage(messageToSend: "envia inico jogo host", convidado: SessionHandler.shared.listaPlayers.first!)
                }
            }
            
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "deixou de ser lider"), object: nil, queue: nil) { (Notification) in
                   DispatchQueue.main.async {
                    self.iniciarRodadaButton.isHidden = true
                    self.iniciarRodadaButton.isEnabled = false
        
            }
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "popUp"), object: nil, queue: nil) { (Notification) in
            
                if SessionHandler.shared.rodadasArray[SessionHandler.shared.rodada].falha == 0 {
                    self.fimRodada(message: "sucesso total")
                    SessionHandler.shared.rodadasArray[SessionHandler.shared.rodada].sucesso += 1
                }
                else if SessionHandler.shared.rodadasArray[SessionHandler.shared.rodada].falha == 1 {
                    self.fimRodada(message: "1falha")
                    SessionHandler.shared.rodadasArray[SessionHandler.shared.rodada].fracasso += 1
                }
                else if SessionHandler.shared.rodadasArray[SessionHandler.shared.rodada].falha == 2 {
                    self.fimRodada(message: "2falha")
                    SessionHandler.shared.rodadasArray[SessionHandler.shared.rodada].fracasso += 1
                }
                else if SessionHandler.shared.rodadasArray[SessionHandler.shared.rodada].falha == 3 {
                    SessionHandler.shared.rodadasArray[SessionHandler.shared.rodada].fracasso += 1
                    self.fimRodada(message: "3falha")
                }
                
            
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        SessionHandler.shared.controller = self
        Model.shared.players.map{print($0.nome)}
    }
        
    @IBAction func iniciaRodada(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Players", bundle: nil)
        let controller  = storyboard.instantiateInitialViewController()!
        controller.modalPresentationStyle = .overCurrentContext
        self.present(controller, animated: false, completion: nil)
    }
    
    
    
    @IBAction func touchDownButton(_ sender: Any) {
        if !showClicked {
            showClicked = true
            if SessionHandler.shared.host{
            DispatchQueue.main.async {
                print(SessionHandler.shared.host, "vai comecar o jogo")
                NotificationCenter.default.post(Notification(name: Notification.Name("Inicia Jogo")))
                }
            
            }
        }
        //anima negocio
        for i in buttons {
            
            if i.titleLabel!.text! == SessionHandler.shared.carta!.nome {
                UIView.animate(withDuration: 0.2, animations: {
                    i.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
                })
            }
        }
    }
    @IBAction func touchUpButton(_ sender: Any) {
        for i in buttons {
            
            if i.titleLabel!.text! == SessionHandler.shared.carta!.nome {
                UIView.animate(withDuration: 0.2, animations: {
                    i.transform = .identity
                })
            }
        }
    }
    
    
    @IBAction func cardButton(_ sender: UIButton) {
        
        for carta in Model.shared.cartas {
            if carta.nome == sender.titleLabel!.text {
                SessionHandler.shared.cardTouched = carta
                self.performSegue(withIdentifier: "showCard", sender: Any?.self)
            }
        }
//        if SessionHandler.shared.host {
//            SessionHandler.shared.cardTouched = SessionHandler.shared.carta!
//            SessionHandler.shared.sawCard = true
//
//            if showClicked == true && sender.titleLabel!.text! == SessionHandler.shared.carta!.nome &&  hostSend == false{
//                SessionHandler.shared.playersConfirmed += 1
//                hostSend = true
//                if (SessionHandler.shared.mcSession?.connectedPeers.count)! + 1 == SessionHandler.shared.playersConfirmed {
//                    NotificationCenter.default.post(Notification(name: Notification.Name("Inicia Jogo")))
//                }
//            }
//            self.performSegue(withIdentifier: "showCard", sender: Any?.self)
//            return
//        }
//
//        if showClicked == true && sender.titleLabel!.text! == SessionHandler.shared.carta!.nome  && messageSend == false{
//
//            SessionHandler.shared.cardTouched = SessionHandler.shared.carta!
//            SessionHandler.shared.sawCard = true
//            //manda mensagem pro host de ok
//            print("visualizou carta", SessionHandler.shared.mcSession?.connectedPeers.first!.displayName)
//
//            let message = "visualizou carta".data(using: .utf8)
//            DispatchQueue.main.async {
//                do {
//                    try SessionHandler.shared.mcSession?.send(message!, toPeers: [(SessionHandler.shared.mcSession?.connectedPeers.first)!], with: .unreliable)
//                    self.messageSend = true
//                } catch {
//                    print("error sending visualizou message")
//                }
//            }
//
//
//            self.performSegue(withIdentifier: "showCard", sender: Any?.self)
//            return
//        }
        
        
        
        
    }
    
    
    @IBAction func regras(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RulesScreen", bundle: nil)
        let controller  = storyboard.instantiateInitialViewController()!
        controller.modalPresentationStyle = .overFullScreen
        DispatchQueue.main.async {
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    func fimRodada(message: String) {
        var message1 : Data!
        //                        NotificationCenter.default.post(Notification(name: Notification.Name("fim  rodada")))
        message1 = message.data(using: .utf8)
        DispatchQueue.main.async{
            do{
                try SessionHandler.shared.mcSession?.send(message1!, toPeers: SessionHandler.shared.mcSession!.connectedPeers, with: .unreliable)
                
                
                
            } catch {
                print("deu ruim")
            }
        }
        let storyboard = UIStoryboard(name: "ResultPopUp", bundle: nil)
        let controller  = storyboard.instantiateInitialViewController()!
        controller.modalPresentationStyle = .overFullScreen
        DispatchQueue.main.async {
            self.present(controller, animated: false, completion: {NotificationCenter.default.post(Notification(name: Notification.Name(message)))})
        }
        
        
        NotificationCenter.default.post(Notification(name: Notification.Name("fim  rodada")))
        
    }
    
    
    
}

