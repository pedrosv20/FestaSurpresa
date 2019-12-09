//
//  WaitingPlayersViewController.swift
//  FestaSurpresa
//
//  Created by Pedro Vargas on 03/12/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit
import SpriteKit

class WaitingPlayersViewController: UIViewController {

    @IBOutlet weak var skView: SKView!
    @IBOutlet weak var skViewHorizontal: SKView!
    @IBOutlet weak var roundStoryLabel: UILabel!
    
    @IBOutlet weak var comecar: UIButton!
    let minPlayers = 2
    let maxPlayer = 8
//    var wait = WaitingRoom()
    var wait:  WaitingRoom?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.endEditing(true)
         
        SessionHandler.shared.controller = self
        if let scene = SKScene(fileNamed: "WaitingRoom"){
            scene.scaleMode = .aspectFill
            wait = scene as! WaitingRoom
            skView.presentScene(scene)
        }
        
        if let scene = SKScene(fileNamed: "HorizontalScene"){
            scene.scaleMode = .aspectFill
            skViewHorizontal.presentScene(scene)
        }
        
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "joinPlayer"), object: nil, queue: nil) { (Notification) in
            print("funcionou")
            DispatchQueue.main.async {
                do {
                try SessionHandler.shared.mcSession?.send("novoConectado".data(using: .utf8)!, toPeers: SessionHandler.shared.mcSession!.connectedPeers, with: .unreliable)
                } catch {
                    print("error sending message")
                }
                
            }
            self.attNumberPlayers()
            
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "joinedPlayer"), object: nil, queue: nil) { (Notification) in
                   print("funcionou")
                   
                   self.attNumberPlayers()
               }
        wait!.createCircle(name: SessionHandler.shared.nome)
        if (SessionHandler.shared.mcSession?.connectedPeers.count)! > 0 {
            for cont in SessionHandler.shared.mcSession!.connectedPeers {
                wait!.createCircle(name: cont.displayName)
            }
        }
        
        roundStoryLabel.layer.borderColor = UIColor.black.cgColor
        roundStoryLabel.layer.borderWidth = 2.0
        roundStoryLabel.layer.cornerRadius = 10.0
        comecar.layer.cornerRadius = 15.0
         
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if SessionHandler.shared.host {
             comecar.isHidden = false
             comecar.isEnabled = false
        } else {
            comecar.isHidden = true
        }
       
        let int = (SessionHandler.shared.mcSession?.connectedPeers.count)! + 1

//        numeroPlayers.text = String(int)
        
    }
    
    @IBAction func comecar(_ sender: Any) {
        sortCard()
        
    }
    
    func attNumberPlayers() {
        
//        nomePlayersd.text += SessionHandler.shared.nome + "\n"
//        SessionHandler.shared.mcSession?.connectedPeers.map{nomePlayersd.text += "\($0.displayName) \n"}
        var cont = SessionHandler.shared.mcSession?.connectedPeers.count
//        print(SessionHandler.shared.mcSession?.connectedPeers[cont! - 1].displayName)
        print("FFOOOOOOI")
        wait?.createCircle(name: (SessionHandler.shared.mcSession?.connectedPeers[cont! - 1].displayName)!)
        // essas duas linhas de cima da pra criar um array
//        self.numeroPlayers.text = String((SessionHandler.shared.mcSession?.connectedPeers.count)! + 1)
//        nomePlayersd.text += SessionHandler.shared.nome
        if (SessionHandler.shared.mcSession?.connectedPeers.count)! + 1 >= minPlayers && (SessionHandler.shared.mcSession?.connectedPeers.count)! + 1 < maxPlayer {
            if SessionHandler.shared.host {
                comecar.isEnabled = true
                comecar.isHidden = false
            }
            
            
        }
    }
    
    func sortCard() {
        var cont = 0
       
        
        if !(SessionHandler.shared.mcSession!.connectedPeers.count + 1 >= minPlayers  && SessionHandler.shared.mcSession!.connectedPeers.count < maxPlayer ) {
            return
        }
        Model.shared.cartas.shuffle()
        Model.shared.players.append(Player(peerID: SessionHandler.shared.peerID, nome: SessionHandler.shared.nome ?? "jonas", carta: Model.shared.cartas[cont], selected: false))
        SessionHandler.shared.carta = Model.shared.cartas[cont]
        cont += 1
        for convidado in SessionHandler.shared.mcSession!.connectedPeers{
            
            SessionHandler.shared.sendMessage(messageToSend: "\(Model.shared.cartas[cont].nome)", convidado: convidado)
            
            print("mensagem enviada \(Model.shared.cartas[cont].nome)")
            print(SessionHandler.shared.mcSession!.connectedPeers.count)
            Model.shared.players.append(Player(peerID: convidado, nome: convidado.displayName, carta: Model.shared.cartas[cont], selected: false))
            cont += 1
            if cont > maxPlayer - 1  {
                cont = 0
            }
            
        }
        let storyboard = UIStoryboard(name: "AllCards", bundle: nil)
        let controller  = storyboard.instantiateInitialViewController()!
        controller.modalPresentationStyle = .overFullScreen
        self.present(controller, animated: false, completion: nil)
 

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
