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
    
    private override init() {
        
    }
    
    
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            print("Connected: \(peerID.displayName)")
            
            
        case .connecting:
            print("Connecting: \(peerID.displayName)")
            
        case .notConnected:
            print("Not Connected: \(peerID.displayName)")
            
            if Model.shared.players.first?.peerID.displayName == peerID.displayName {
                session.disconnect()
            }
            
        @unknown default:
            print("fatal error")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        DispatchQueue.main.async { [unowned self] in
                    // send chat message
                    let message = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)! as String
                    for carta in Model.shared.cartas {
                        if carta.nome == message {
                            print(carta.nome, "carta")
                            self.carta = carta                          
                            
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

