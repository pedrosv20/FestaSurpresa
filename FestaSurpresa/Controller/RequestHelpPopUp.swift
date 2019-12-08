//
//  RequestHelpPopUp.swift
//  FestaSurpresa
//
//  Created by Pedro Vargas on 07/12/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit

class RequestHelpPopUp: UIViewController {

    
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var atrapalharButton: UIButton!
    @IBOutlet weak var popUpView: UIView!
    
    
    override func viewDidLoad() {
    
        helpButton.layer.cornerRadius = 15.5
        atrapalharButton.layer.cornerRadius = 15.5
        
        popUpView.layer.cornerRadius = 10.0
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        SessionHandler.shared.lider = false
        
    }
    
    @IBAction func ajudar(_ sender: Any) {
        //manda message host
        if SessionHandler.shared.host {
            //rodada atual +  ajudar
            SessionHandler.shared.pessoasNaMissao += 1
            SessionHandler.shared.rodadasArray[SessionHandler.shared.rodada].ajuda += 1
            
            if SessionHandler.shared.pessoasNaMissao == 3{
                //notificacao fim missao
                // aumenta sucesso
                
                NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "popUp")))
                
            }
            
            dismiss(animated: false, completion: nil)
            
            return
        }
        SessionHandler.shared.sendMessage(messageToSend: "ajudou missao", convidado: ((SessionHandler.shared.mcSession?.connectedPeers.first!)!))
        
        dismiss(animated: false, completion: nil)
        
    }
    
   
    
    @IBAction func atrapalhar(_ sender: Any) {
        if SessionHandler.shared.host{
            //atrapalha ++
            SessionHandler.shared.pessoasNaMissao += 1
            SessionHandler.shared.rodadasArray[SessionHandler.shared.rodada].falha += 1
            
            if SessionHandler.shared.pessoasNaMissao == 3 {
                //notificacao fim missao
                NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "popUp")))
            }
            
            dismiss(animated: false, completion: nil)
            return
        }
        SessionHandler.shared.sendMessage(messageToSend: "falhou missao", convidado: ((SessionHandler.shared.mcSession?.connectedPeers.first!)!))
        dismiss(animated: false, completion: nil)
    }
    

}
