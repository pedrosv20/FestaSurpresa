import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate {
    
    
    
    @IBOutlet weak var chatView: UITextView!
    @IBOutlet weak var inputMessage: UITextField!
    
    @IBAction func tapSendButton(_ sender: Any) {
        print(listaConvidados.count)
        messageToSend = "\(peerID.displayName): \(inputMessage.text!)\n"
        let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        do {
            try self.mcSession.send(message!, toPeers: self.mcSession.connectedPeers, with: .unreliable)
            chatView.text = chatView.text + messageToSend
            inputMessage.text = ""
        }
        catch {
            print("Error sending message")
        }
    }
    
    @IBAction func SortCard(_ sender: Any) {
        var cont = 0
        cartas.shuffle()
        for convidado in listaConvidados{
            sendMessage(messageToSend: "\(cartas[cont]) \n", convidado: convidado)
            cont += 1
            if cont == listaConvidados.count {
                cont = 0
                
            }
        }
    }
    
    //Todo: fazer func sendMessage
    
    
    var peerID: MCPeerID!
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant!
    var messageToSend: String!
    var listaConvidados: [MCPeerID] = []
    var cartas: [String] = ["Amigo","Namorado","Pai","Bebado","Penetra","Distraido","Palhaço"]
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showConnectionMenu))
        
        peerID = MCPeerID(displayName: UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self
        
    }
    
    func sendMessage(messageToSend: String, convidado: MCPeerID) {
        let message = messageToSend.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        do {
            try self.mcSession.send(message!, toPeers: [convidado], with: .unreliable)
            chatView.text = chatView.text + messageToSend
            inputMessage.text = ""
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
        mcBrowser.maximumNumberOfPeers = 10
        mcBrowser.minimumNumberOfPeers = 5
        mcBrowser.delegate = self
        
        present(mcBrowser, animated: true)
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            print("Connected: \(peerID.displayName)")
            print("Adiciona no array")
            listaConvidados.append(peerID)
        case .connecting:
            print("Connecting: \(peerID.displayName)")
        case .notConnected:
            print("Not Connected: \(peerID.displayName)")
            listaConvidados.remove(at: listaConvidados.firstIndex(of: peerID)!)
            print("lista sem fodidods \(listaConvidados)")
        @unknown default:
            print("fatal error")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        DispatchQueue.main.async { [unowned self] in
            // send chat message
            let message = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)! as String
            self.chatView.text = self.chatView.text + message
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

