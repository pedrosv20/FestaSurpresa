import Foundation
import UIKit

class Carta {
    
    var nome:String
    var descricao:String
    var doBem:Bool
    var poder:String
    var icone:UIImage!
    
    init(nome: String, descricao: String, doBem: Bool, poder:String, icone: UIImage!) {
        self.nome = nome
        self.descricao = descricao
        self.doBem = doBem
        self.poder = poder
        self.icone = icone
    }
}
