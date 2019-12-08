//
//  ResultPopUp.swift
//  FestaSurpresa
//
//  Created by Maria Fernanda Azolin on 03/12/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit

class ResultPopUp: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !SessionHandler.shared.host {
            (SessionHandler.shared.mcSession?.connectedPeers.sorted{ $0.displayName < $1.displayName})!
        }
        okButton.layer.cornerRadius = 15.0
        popUpView.layer.cornerRadius = 10.0
    
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "sucesso total"), object: nil, queue: nil) { (Notification) in
            self.resultLabel.text! += "sucesso total"
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "1falha"), object: nil, queue: nil) { (Notification) in
            self.resultLabel.text! += "1falha"
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "2falha"), object: nil, queue: nil) { (Notification) in
            self.resultLabel.text! += "2falha"
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "3falha"), object: nil, queue: nil) { (Notification) in
            self.resultLabel.text! += "3falha"
        }
    
        
        
    }
    
    
    
    @IBAction func didPressOkButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    
}
