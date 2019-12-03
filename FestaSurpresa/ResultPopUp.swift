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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        okButton.layer.cornerRadius = 15.0
        
    }


    @IBAction func didPressOkButton(_ sender: Any) {
    }
    

}
