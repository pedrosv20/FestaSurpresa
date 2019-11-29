//
//  CardViewController.swift
//  FestaSurpresa
//
//  Created by Maria Fernanda Azolin on 27/11/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var roundStoryLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var roleTitleLabel: UILabel!
    @IBOutlet weak var hideCardButton: UIButton!
    
    
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
        
        roleTitleLabel.layer.borderColor = UIColor.black.cgColor
        roleTitleLabel.layer.borderWidth = 2.0
        roleTitleLabel.layer.cornerRadius = 20.0
        
        hideCardButton.layer.cornerRadius = 15.0
        
        cardView.layer.cornerRadius = 15.0
    }
    

}

class Colors {
    var gl:CAGradientLayer!

    init() {
        let colorTop = UIColor(red: 217.0 / 255.0, green: 196.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 229.0 / 255.0, green: 188.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0).cgColor

        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}
