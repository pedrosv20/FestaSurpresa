//
//  PopUpViewController.swift
//  FestaSurpresa
//
//  Created by Maria Fernanda Azolin on 03/12/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var escolhidosLabel: UILabel!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var atrapalharButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        helpButton.layer.cornerRadius = 15.0
        atrapalharButton.layer.cornerRadius = 15.0
    }


    @IBAction func didPressHelpButton(_ sender: Any) {
    }
    
    @IBAction func didPressAtrapalharButton(_ sender: Any) {
    }
    
}
