//
//  AllCardsViewController.swift
//  FestaSurpresa
//
//  Created by Maria Fernanda Azolin on 27/11/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit

class AllCardsViewController: UIViewController {

    
    @IBOutlet weak var showCardButton: UIButton!
    @IBOutlet weak var roundStoryLabel: UILabel!
    
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
        
        roundStoryLabel.layer.borderColor = UIColor.black.cgColor
        roundStoryLabel.layer.borderWidth = 2.0
        roundStoryLabel.layer.cornerRadius = 20.0
        
        showCardButton.layer.cornerRadius = 15.0
    }
    

}

