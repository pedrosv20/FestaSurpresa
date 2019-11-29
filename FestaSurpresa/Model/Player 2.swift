import MultipeerConnectivity
import Foundation
class Player{
    
    var peerID: MCPeerID
    var carta: Carta
    var nomeJogador:String
    
    init(peerID: MCPeerID, carta: Carta,nomeJogador:String) {
        self.peerID = peerID
        self.carta = carta
        self.nomeJogador=nomeJogador
    }
    
}
