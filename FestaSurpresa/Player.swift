//
//  Player.swift
//  FestaSurpresa
//
//  Created by Mateus Nunes on 28/11/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import Foundation
import MultipeerConnectivity

class Player {
    
    var peerID: MCPeerID
    var nome: String
    var carta: Carta?
    var selected: Bool
    
    init(peerID: MCPeerID, nome:String, carta:Carta?, selected: Bool) {
        self.peerID = peerID
        self.nome = nome
        self.carta = carta
        self.selected = selected
    }
}
