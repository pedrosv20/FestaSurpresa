//
//  Rodada.swift
//  FestaSurpresa
//
//  Created by Pedro Vargas on 07/12/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import Foundation

class Rodada {
    
    var numero = 0
    
    var sucesso = 0
    var fracasso = 0

    var ajuda = 0
    var falha = 0
    
    init(numero: Int, sucesso: Int, ajuda: Int, falha: Int) {
        self.numero = numero
        self.sucesso = sucesso
        self.ajuda = ajuda
        self.falha = falha
    }
}
