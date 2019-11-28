import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate {
    
    
    
    //    @IBOutlet weak var chatView: UITextView!
    //    @IBOutlet weak var inputMessage: UITextField!
    
    @IBOutlet weak var nome: UITextField!
    
    var peerID: MCPeerID!
    var observer: NSObjectProtocol!
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant!
    var messageToSend: String!
    var player: Player!
    var cartas: [Carta] = Model.shared.cartas
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        peerID = MCPeerID(displayName: UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self
        player = Player(peerID: peerID, nome: nome.text!, carta: nil, selected: false)
        //        listaConvidados = mcSession.connectedPeers
        
    }
    
    //TODO: extension de MCPeerID com atributo do tipo da carta, enum
    @IBAction func regras(_ sender: Any) {
        player.nome = nome.text!
        print(player.carta?.nome)
        print(player.nome)
    }
    
    @IBAction func tapSendButton(_ sender: Any) {
        showConnectionMenu()
        //        print(self.peerID.carta?.descricao ?? "n rolou")
        //        print(self.peerID.carta?.doBem ?? "n rolou")
        //        print(self.peerID.carta?.nome ?? "n rolou")
        //        print(self.peerID.carta?.poder ?? "n rolou")
        
        
        //        messageToSend = "\(peerID.displayName): \(inputMessage.text!) \n"
        //        let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
        //
        //        do {
        //            try self.mcSession.send(message!, toPeers: self.mcSession.connectedPeers, with: .unreliable)
        //            chatView.text = chatView.text + messageToSend
        //            inputMessage.text = ""
        //        }
        //        catch {
        //            print("Error sending message")
        //        }
    }
    
    @IBAction func SortCard(_ sender: Any) {
        var cont = 0
        let minPlayers = 2
        let maxPlayer = 8
        
        if !(mcSession.connectedPeers.count >= minPlayers - 1 && mcSession.connectedPeers.count < maxPlayer ) {
            return
        }
        cartas.shuffle()
        
//        chatView.text = chatView.text + "\(cartas[cont].nome) \n"
        player.carta = cartas[cont]
        cont += 1
        for convidado in mcSession.connectedPeers{
            
            sendMessage(messageToSend: "\(cartas[cont].nome)", convidado: convidado)
            cont += 1
            if cont <= mcSession.connectedPeers.count {
                cont = 0
            }
            
        }
    }
    
    func sendMessage(messageToSend: String, convidado: MCPeerID) {
        let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
        do {
            
            try self.mcSession.send(message!, toPeers: [convidado], with: .unreliable)
        }
        catch {
            print("Error sending message")
        }
    }
    
    @objc func showConnectionMenu() {
        let ac = UIAlertController(title: "Connection Menu", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Host a session", style: .default, handler: hostSession))
        ac.addAction(UIAlertAction(title: "Join a session", style: .default, handler: joinSession))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    func hostSession(action: UIAlertAction) {
        print("Nome: \(UIDevice.current.name)")
        
        
        mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "festa-surpresa", discoveryInfo: nil, session: mcSession)
        mcAdvertiserAssistant.start()
    }
    
    func joinSession(action: UIAlertAction) {
        let mcBrowser = MCBrowserViewController(serviceType: "festa-surpresa", session: mcSession)
        mcBrowser.delegate = self
        
        present(mcBrowser, animated: true)
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
            for carta in Model.shared.cartas {
                if carta.nome == message {
                    self.player = Player(peerID: self.peerID, nome: self.nome.text!, carta: carta, selected: false)
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
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
    
    
    
}
