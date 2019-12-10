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
        
        okButton.layer.cornerRadius = 15.0
        popUpView.layer.cornerRadius = 10.0
    
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "sucesso total"), object: nil, queue: nil) { (Notification) in
            self.resultLabel.text! = "A etapa foi um sucesso total."
                    }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "1falha"), object: nil, queue: nil) { (Notification) in
            self.resultLabel.text! = "A etapa teve 1 voto de falha."
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "2falha"), object: nil, queue: nil) { (Notification) in
            self.resultLabel.text! = "A etapa teve 2 votos de falha."
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "3falha"), object: nil, queue: nil) { (Notification) in
            self.resultLabel.text! = "A etapa teve 3 votos de falha."
        }
        
    
        
        
    }
    
    
    
    @IBAction func didPressOkButton(_ sender: Any) {
        if SessionHandler.shared.sucessoRodadas == 4 {
            
            let storyboard = UIStoryboard(name: "Win", bundle: nil)
            let controller  = storyboard.instantiateInitialViewController() as WinViewController?
            
            dismiss(animated: false, completion: {
                DispatchQueue.main.async(execute: {
                    controller!.modalPresentationStyle = .overFullScreen
                    controller?.winner = "Organizer"
                    SessionHandler.shared.controller.present(controller!, animated: false, completion: nil)
                })})
            
            
        }
        else if SessionHandler.shared.fracassoRodadas == 4 {
            let storyboard = UIStoryboard(name: "Win", bundle: nil)
            let controller  = storyboard.instantiateInitialViewController() as WinViewController?
            
            dismiss(animated: false, completion: {
                DispatchQueue.main.async(execute: {
                    controller!.modalPresentationStyle = .overFullScreen
                    controller?.winner = "Party Pooper"
                    SessionHandler.shared.controller.present(controller!, animated: false, completion: nil)
                })})
        }
        else {
            dismiss(animated: false, completion: nil)
        }
        
        
    }
    
    
}
