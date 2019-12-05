import Foundation
class Carta {
    
    var nome:String
    var descricao:String
    var doBem:Bool
    var poder:String
    init(nome: String, descricao: String, doBem: Bool,poder:String) {
        self.nome = nome
        self.descricao = descricao
        self.doBem = doBem
        self.poder = poder
    }
}
