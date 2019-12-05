//
//  Colors.swift
//  FestaSurpresa
//
//  Created by Mateus Nunes on 01/12/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import Foundation
import UIKit
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
