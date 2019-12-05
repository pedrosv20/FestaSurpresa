//
//  SessionHandler.swift
//  FestaSurpresa
//
//  Created by Pedro Vargas on 29/11/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import Foundation
import MultipeerConnectivity

class SessionHandler: NSObject, MCSessionDelegate {

    static let shared = SessionHandler()
    
    var peerID: MCPeerID!
    var nome: String!
    var mcSession: MCSession?
    var mcAdvertiserAssistant: MCAdvertiserAssistant?
    var carta: Carta?
    var host = false
    var peerChuncho: String!
    var controller: UIViewController!
    
    var cardTouched: Carta!
    var sawCard = false
    
    var playersConfirmed = 0
    
    var rodada = 1
    
    var lider = false
    
    private override init() {
        
    }
    
    func sendMessage(messageToSend: String, convidado: MCPeerID) {
        
        let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
        DispatchQueue.main.async {
            
            do {
                
                try SessionHandler.shared.mcSession!.send(message!, toPeers: [convidado], with: .unreliable)
            }
            catch {
                print("Error sending message")
            }
        }
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            print("Connected: \(peerID.displayName)")
            
            
        case .connecting:
            print("Connecting: \(peerID.displayName)")
            
        case .notConnected:
            print("Not Connected: \(peerID.displayName)")
            

            
        @unknown default:
            print("fatal error")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        DispatchQueue.main.async { [unowned self] in
            // send chat message
            let message = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)! as String
            print(message)
            
            for carta in Model.shared.cartas {
                if carta.nome == message {
                    print(carta.nome, "carta")
                    self.carta = carta
                    
                    
                    let storyboard = UIStoryboard(name: "AllCards", bundle: nil)
                    let controller  = storyboard.instantiateInitialViewController()!
                    controller.modalPresentationStyle = .overFullScreen
                    self.controller.present(controller, animated: false, completion: nil)
                    
                }
            }

            
            if message == "lider" {
                self.lider = true
                NotificationCenter.default.post(Notification(name: Notification.Name("inicia lider")))
            }
            if message == "hostSaiu" {
                self.controller.dismiss(animated: false, completion: nil)
                let mensagem = "playerAvisaHostSaiu".data(using: String.Encoding.utf8, allowLossyConversion: false)
                do {
                    
                    try SessionHandler.shared.mcSession!.send(mensagem!, toPeers: self.mcSession!.connectedPeers, with: .unreliable)
                }
                catch {
                    print("Error sending message")
                }
                return
            }
            if message == "playerAvisaHostSaiu" {
                self.controller.dismiss(animated: false, completion: nil)
            }
                
            if message == "novoConectado" {
                NotificationCenter.default.post(Notification(name: Notification.Name("joinedPlayer")))
                return
            }
                
            if message == "conectei" {
                NotificationCenter.default.post(Notification(name: Notification.Name("joinPlayer")))
                return
            }
            
            if self.host {
                if message == "visualizou carta" {
                    self.playersConfirmed += 1
                    print(self.playersConfirmed,  "confirmados")
                    if self.playersConfirmed == (self.mcSession?.connectedPeers.count)! + 1 {
                        NotificationCenter.default.post(Notification(name:Notification.Name("Inicia Jogo")))
                        }
                }
            }
            
            
            //TODO: Busca no singleton e referencia os roles do player
            //            self.chatView.text = self.chatView.text + message + " \n"
        }
    }
        
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
        
        
        
}


