import UIKit

class Model
{
    static let shared = Model()
    
    var players: [Player] = []
//    var cartasMal = Model.shared.cartas.filter({$0.doBem == false})
//    var cartasBem = Model.shared.cartas.filter({$0.doBem})
    var cartas = [
        Carta(nome: "Namorado", descricao: "Chegou a hora de mostrar todo seu amor. Você está no comando da organização e o sucesso dessa festa (e consequentemente a felicidade do(a) seu amado(a)) dependem de você.", doBem: true, poder: "Trocar de papel com qualquer jogador, em dado momento da festa", icone: UIImage(named:"namorado")!),
        
        Carta(nome: "Melhor amigo", descricao: "Você sabe o quanto seu amigo sempre desejou uma festa dessas. Não vamos decepcioná-lo, né?", doBem: true, poder: "Olhar o papel de qualquer outro jogador, em dado momento da festa", icone: UIImage(named:"amigo")!),
        
        Carta(nome: "Penetra", descricao: "Você já veio para a festa sem ser convidado. O mínimo que pode fazer é ajudar", doBem: true, poder: "Caso os organizadores façam 4 pontos, você pode ver a identidade do bêbado", icone: UIImage(named:"penetra")!),
        
        Carta(nome: "Pai", descricao: "Você precisa controlar a organização da festa para que a festa dê certo e, mais importante, sua casa não termine destruída", doBem: true, poder: "Nenhum", icone: UIImage(named:"pai")!),
        
        Carta(nome: "Mãe", descricao: "Junto com seu marido é necessário organizar a festa, nós sabemos como os convidados são desajeitados, é importante manter tudo em ordem!", doBem: true, poder: "Nenhum", icone: UIImage(named:"mae")!),
        
        Carta(nome: "Distraído", descricao: "Você quer ajudar, mas não consegue manter a boca fechada. Será que você vai acabar estragando a surpresa?", doBem: false, poder: "Caso os desorganizadores façam 3 pontos, poderá trocar de papel com o palhaço.", icone: UIImage(named:"desatento")!),
        
        Carta(nome: "Bêbado", descricao: "Você nem sabe o que está acontecendo, mas o importante é que estamos numa festa. Certo?", doBem: false, poder: "Você está tão bêbado que mal consegue andar. Quanto mais ter um poder.", icone: UIImage(named:"bebado")!),
        
        
        Carta(nome: "Palhaço", descricao: "Você foi contratado para animar a festa, mas quem disse que é isso que você vai fazer? Cada um por si.", doBem: false, poder: "Você não tem um poder, mas você não precisa disso", icone: UIImage(named:"palhaco copy 3")!)
        
        
            
    ]
    
    var tarefas = [
        Tarefa(tituloTarefa: "O bolo precisa ser encomendado. Líder, escolha X jogadores para te ajudarem a escolher o sabor.", numeroTarefa: 1),
        Tarefa(tituloTarefa: "Os 37 barris de chopp chegaram. Líder, escolha X pessoas para ajudar a descarregar a bebida sem derramar nem uma gota.", numeroTarefa: 2),
        Tarefa(tituloTarefa: "A cama elástica é a principal atração. Líder, escolha X pessoas para te ajudarem a montar o brinquedo", numeroTarefa: 3),
        Tarefa(tituloTarefa: "o ambiente tem que estar perfeito. Líder, escolha X jogadores para te ajudarem a encher os balões.", numeroTarefa: 4),
        Tarefa(tituloTarefa: "Os vegetarianos também precisam comer. Líder, escolha X jogadores para te ajudem a lavar a  alface.", numeroTarefa: 5),
        Tarefa(tituloTarefa: "As crianças precisam brincar, ajude a encher as piscina de bolinhas", numeroTarefa: 6)
    ]
    private init(){}
}
