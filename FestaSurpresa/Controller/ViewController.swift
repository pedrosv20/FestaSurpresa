import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate, UITextFieldDelegate {
    
    
    
    //    @IBOutlet weak var chatView: UITextView!
    //    @IBOutlet weak var inputMessage: UITextField!
    
    @IBOutlet weak var nome: UITextField!
    
    var peerID: MCPeerID!
    var observer: NSObjectProtocol!
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant!
    var messageToSend: String!
    var player: Player!
<<<<<<< HEAD
    var cartas: [Carta] = Model.shared.cartas
=======
    
    @IBOutlet weak var startSessionButton: UIButton!
>>>>>>> Mafe
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
<<<<<<< HEAD
        SessionHandler.shared.peerID = MCPeerID(displayName: UIDevice.current.name)
        SessionHandler.shared.mcSession = MCSession(peer: SessionHandler.shared.peerID, securityIdentity: nil, encryptionPreference: .required)
        SessionHandler.shared.mcSession!.delegate = self
=======
        nome?.delegate = self
        
        startSessionButton.layer.cornerRadius = 15.0
        startSessionButton.isEnabled = false
        startSessionButton.alpha = 0.7
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        nome.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)

>>>>>>> Mafe
        
        
//        player = Player(peerID: peerID, nome: nome.text!, carta: nil, selected: false)
        //        listaConvidados = mcSession.connectedPeers
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if nome.text != "" {
            startSessionButton.isEnabled  = true
            startSessionButton.alpha = 1.0
            SessionHandler.shared.nome = nome.text
        } else {
            startSessionButton.isEnabled  = false
            startSessionButton.alpha = 0.7
        }
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y == 0 {
                    self.view.frame.origin.y -= keyboardSize.height
                }
            }
        }
        
        @objc func keyboardWillHide(notification: NSNotification) {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }



    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            view.endEditing(true)
        
        if nome != nil && nome.text != "" {
            startSessionButton.isEnabled = true
            startSessionButton.alpha = 1.0
            SessionHandler.shared.nome = nome.text
        }
        else {
            startSessionButton.isEnabled = false
            startSessionButton.alpha = 0.7
        }
        
            return false
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
        cartas.shuffle()
        
//        chatView.text = chatView.text + "\(cartas[cont].nome) \n"
//        player.carta = cartas[cont]
        print(cartas[cont].nome)
    Model.shared.players.append(Player(peerID: SessionHandler.shared.peerID, nome: nome.text!, carta: cartas[cont], selected: false))
        SessionHandler.shared.carta = cartas[cont]
        cont += 1
        for convidado in SessionHandler.shared.mcSession!.connectedPeers{
            
            sendMessage(messageToSend: "\(cartas[cont].nome)", convidado: convidado)
            cont += 1
            if cont <= SessionHandler.shared.mcSession!.connectedPeers.count {
                cont = 0
            }
            
        }
    }
    
    
    
    @IBAction func didEndEditingNome(_ sender: Any) {
        if nome != nil {
            
            //startSessionButton.isEnabled  = true
        }
    }
    
    
    

    
    @IBAction func didStartEdittingName(_ sender: Any) {
        startSessionButton.isEnabled  = false
        startSessionButton.alpha = 0.7
        if nome != nil && nome.text != "" {
            startSessionButton.isEnabled  = true
            startSessionButton.alpha = 1.0
        }
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
        
<<<<<<< HEAD
=======
        SessionHandler.shared.host = true
        
        SessionHandler.shared.peerID = MCPeerID(displayName: "1 - " + SessionHandler.shared.nome)
        SessionHandler.shared.mcSession = MCSession(peer: SessionHandler.shared.peerID, securityIdentity: nil, encryptionPreference: .required)
        SessionHandler.shared.mcSession!.delegate = self
>>>>>>> Mafe
        SessionHandler.shared.mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "festa-surpresa", discoveryInfo: nil, session: SessionHandler.shared.mcSession!)

        SessionHandler.shared.mcAdvertiserAssistant!.start()
    }
    
    func joinSession(action: UIAlertAction) {
<<<<<<< HEAD
=======
        SessionHandler.shared.peerID = MCPeerID(displayName: SessionHandler.shared.nome)
        SessionHandler.shared.mcSession = MCSession(peer: SessionHandler.shared.peerID, securityIdentity: nil, encryptionPreference: .required)
        SessionHandler.shared.mcSession!.delegate = self
        
>>>>>>> Mafe
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
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
<<<<<<< HEAD
=======
        
        let storyboard = UIStoryboard(name: "WaitingPlayers", bundle: nil)
        let controller  = storyboard.instantiateInitialViewController()!
        controller.modalPresentationStyle = .overFullScreen
        
        DispatchQueue.main.async {
            
            self.present(controller, animated: false, completion: nil)
        }
>>>>>>> Mafe
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
    
    
    
}
