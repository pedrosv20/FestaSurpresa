//
//  RequestHelpPopUp.swift
//  FestaSurpresa
//
//  Created by Pedro Vargas on 07/12/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit

class RequestHelpPopUp: UIViewController {

    
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var atrapalharButton: UIButton!
    @IBOutlet weak var popUpView: UIView!
    
    
    override func viewDidLoad() {
    
        helpButton.layer.cornerRadius = 15.5
        atrapalharButton.layer.cornerRadius = 15.5
        
        popUpView.layer.cornerRadius = 10.0
        
    }
    

}
