import UIKit
import MultipeerConnectivity
import SpriteKit

class ViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate, UITextFieldDelegate {
    
    
    
    //    @IBOutlet weak var chatView: UITextView!
    //    @IBOutlet weak var inputMessage: UITextField!
    
    //TODO botao de começar so funciona pro host que vai enviar carta para todos
    // cada um ve sua carta e clica em esconder ou pronto!
    // no model tem q ter todas tarefas para ir passando
    // telas de discussao ou loading para carregar tudo
    
    //TODO desconecta host todo mundo sai da sala
    //TODO  desconecta outro se mata da sessao
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var skView: SKView!
    
   
    var peerID: MCPeerID!
    var observer: NSObjectProtocol!
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant!
    var messageToSend: String!
    var player: Player!
    
    @IBOutlet weak var startSessionButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Model.shared.tarefas.shuffle()
        
        if let scene = SKScene(fileNamed: "HorizontalScene"){
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
        self.navigationController?.navigationBar.isHidden = true
        
        nome?.delegate = self
        
        startSessionButton.layer.cornerRadius = 10.0
        startSessionButton.isEnabled = false
        startSessionButton.alpha = 0.7
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        nome.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)

        
//        NotificationCenter.default.addObserver(forName: UIApplication.willTerminateNotification, object: nil, queue: nil) { (notification) in
//            SessionHandler.shared.mcSession?.disconnect()
//        }
            

        
        //        player = Player(peerID: peerID, nome: nome.text!, carta: nil, selected: false)
        //        listaConvidados = mcSession.connectedPeers
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
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
        
        let storyboard = UIStoryboard(name: "RulesScreen", bundle: nil)
        let controller  = storyboard.instantiateInitialViewController()!
        controller.modalPresentationStyle = .overFullScreen
        DispatchQueue.main.async {
            self.present(controller, animated: false, completion: nil)
        }
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
    
    
        
//        let controller = CardViewController()

//        let storyboard = UIStoryboard(name: "Card 2", bundle: nil)
//        let controller  = storyboard.instantiateInitialViewController()!
//        controller.modalPresentationStyle = .overFullScreen
//        self.present(controller, animated: false, completion: nil)
    
    
    
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
        ac.addAction(UIAlertAction(title: "Criar sala", style: .default, handler: hostSession))
        ac.addAction(UIAlertAction(title: "Entrar em uma sala", style: .default, handler: joinSession))
        ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        present(ac, animated: true)
    }
    
    func hostSession(action: UIAlertAction) {
        
        SessionHandler.shared.host = true
        
        SessionHandler.shared.peerID = MCPeerID(displayName: "1 - " + SessionHandler.shared.nome)
        SessionHandler.shared.mcSession = MCSession(peer: SessionHandler.shared.peerID, securityIdentity: nil, encryptionPreference: .required)
        SessionHandler.shared.mcSession!.delegate = self
        SessionHandler.shared.mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "festa-surpresa", discoveryInfo: nil, session: SessionHandler.shared.mcSession!)
        SessionHandler.shared.mcAdvertiserAssistant!.start()
        
        let storyboard = UIStoryboard(name: "WaitingPlayers", bundle: nil)
        let controller  = storyboard.instantiateInitialViewController()!
        controller.modalPresentationStyle = .overFullScreen
        
        DispatchQueue.main.async {
            
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    func joinSession(action: UIAlertAction) {
        SessionHandler.shared.host = false
        SessionHandler.shared.peerID = MCPeerID(displayName: SessionHandler.shared.nome)
        SessionHandler.shared.mcSession = MCSession(peer: SessionHandler.shared.peerID, securityIdentity: nil, encryptionPreference: .required)
        SessionHandler.shared.mcSession!.delegate = self
        
        let mcBrowser = MCBrowserViewController(serviceType: "festa-surpresa", session: SessionHandler.shared.mcSession!)
        mcBrowser.delegate = self
        
        DispatchQueue.main.async {
            
            self.present(mcBrowser, animated: false, completion: nil)
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
        
        SessionHandler.shared.session(session, didReceive: data, fromPeer: peerID)
        
//        let storyboard = UIStoryboard(name: "Card 2", bundle: nil)
//        let controller  = storyboard.instantiateInitialViewController()!
//        controller.modalPresentationStyle = .overFullScreen
//
//        DispatchQueue.main.async {
//
//            self.present(controller, animated: false, completion: nil)
//        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        print("clicou done")
        
        
        sendMessage(messageToSend: "conectei", convidado: SessionHandler.shared.listaPlayers.first!)
        
        dismiss(animated: true)
        
        let storyboard = UIStoryboard(name: "WaitingPlayers", bundle: nil)
        let controller  = storyboard.instantiateInitialViewController()!
        controller.modalPresentationStyle = .overFullScreen
        
        DispatchQueue.main.async {
            
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
    
    
    
}
