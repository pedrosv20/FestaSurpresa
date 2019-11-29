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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        SessionHandler.shared.peerID = MCPeerID(displayName: UIDevice.current.name)
        SessionHandler.shared.mcSession = MCSession(peer: SessionHandler.shared.peerID, securityIdentity: nil, encryptionPreference: .required)
        SessionHandler.shared.mcSession!.delegate = self
        
        
        //        player = Player(peerID: peerID, nome: nome.text!, carta: nil, selected: false)
        //        listaConvidados = mcSession.connectedPeers
        
    }
    
    //TODO: extension de MCPeerID com atributo do tipo da carta, enum
    @IBAction func regras(_ sender: Any) {
        SortCard()
        //        player.nome = nome.text!
        //        print(player.carta?.nome)
        //        print(player.nome)
    }
    
    @IBAction func tapSendButton(_ sender: Any) {
        //        print(SessionHandler.shared.mcSession?.connectedPeers)
        //        print(SessionHandler.shared.carta?.nome)
        print(Model.shared.players)
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
    
    func SortCard() {
        var cont = 0
        let minPlayers = 2
        let maxPlayer = 8
        
        if !(SessionHandler.shared.mcSession!.connectedPeers.count >= minPlayers - 1 && SessionHandler.shared.mcSession!.connectedPeers.count < maxPlayer ) {
            return
        }
        Model.shared.cartas.shuffle()
        Model.shared.cartas.map({print($0.nome, "teste")})
        //        chatView.text = chatView.text + "\(cartas[cont].nome) \n"
        //        player.carta = cartas[cont]
        Model.shared.players.append(Player(peerID: SessionHandler.shared.peerID, nome: nome.text!, carta: Model.shared.cartas[cont], selected: false))
        SessionHandler.shared.carta = Model.shared.cartas[cont]
        cont += 1
        for convidado in SessionHandler.shared.mcSession!.connectedPeers{
            
            sendMessage(messageToSend: "\(Model.shared.cartas[cont].nome)", convidado: convidado)
            print("mensagem enviada \(Model.shared.cartas[cont].nome)")
            print(SessionHandler.shared.mcSession!.connectedPeers.count)
            cont += 1
            if cont > maxPlayer - 1  {
                cont = 0
            }
            
        }
        
//        let controller = CardViewController()

        let storyboard = UIStoryboard(name: "Card 2", bundle: nil)
        let controller  = storyboard.instantiateInitialViewController()!
        controller.modalPresentationStyle = .overFullScreen
        self.present(controller, animated: false, completion: nil)
    }
    
    func sendMessage(messageToSend: String, convidado: MCPeerID) {
        let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
        do {
            
            try SessionHandler.shared.mcSession!.send(message!, toPeers: [convidado], with: .unreliable)
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
        
        SessionHandler.shared.mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "festa-surpresa", discoveryInfo: nil, session: SessionHandler.shared.mcSession!)
        
        SessionHandler.shared.mcAdvertiserAssistant!.start()
    }
    
    func joinSession(action: UIAlertAction) {
        let mcBrowser = MCBrowserViewController(serviceType: "festa-surpresa", session: SessionHandler.shared.mcSession!)
        mcBrowser.delegate = self
        
        present(mcBrowser, animated: true)
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            print("Connected: \(SessionHandler.shared.peerID.displayName)")
            
            
        case .connecting:
            print("Connecting: \(SessionHandler.shared.peerID.displayName)")
            
        case .notConnected:
            print("Not Connected: \(SessionHandler.shared.peerID.displayName)")
            
        @unknown default:
            print("fatal error")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("recebeu algo mas deu bosta")
        SessionHandler.shared.session(session, didReceive: data, fromPeer: peerID)
        let storyboard = UIStoryboard(name: "Card 2", bundle: nil)
        let controller  = storyboard.instantiateInitialViewController()!
        controller.modalPresentationStyle = .overFullScreen
        
        DispatchQueue.main.async {
            
            self.present(controller, animated: false, completion: nil)
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
