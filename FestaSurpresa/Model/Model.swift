import UIKit

class Model
{
    static let shared = Model()
    
    var players: [Player] = []
//    var cartasMal = Model.shared.cartas.filter({$0.doBem == false})
//    var cartasBem = Model.shared.cartas.filter({$0.doBem})
    var cartas = [
        Carta(nome: "Namorado", descricao: "Chegou a hora de mostrar todo seu amor. Você está no comando da organização e o sucesso dessa festa (e consequentemente a felicidade do(a) seu amado(a)) dependem de você.", doBem: true, poder: "Trocar de papel com qualquer jogador, em dado momento da festa.", icone: UIImage(named:"namorado")!),
        
        Carta(nome: "Melhor amigo", descricao: "Você sabe o quanto seu amigo sempre desejou uma festa dessas. Não vamos decepcioná-lo, né?", doBem: true, poder: "Olhar o papel de qualquer outro jogador, em dado momento da festa", icone: UIImage(named:"amigo")!),
        
        Carta(nome: "Penetra", descricao: "Você já veio para a festa sem ser convidado. O mínimo que pode fazer é ajudar", doBem: true, poder: "Caso os organizadores façam 4 pontos, você pode ver a identidade do bêbado", icone: UIImage(named:"penetra")!),
        
        Carta(nome: "Pai", descricao: "Você precisa controlar a organização da festa para que a festa dê certo e, mais importante, sua casa não termine destruída.", doBem: true, poder: "Jogador extra. Nenhum.", icone: UIImage(named:"pai")!),
        
        Carta(nome: "Mãe", descricao: "É necessário organizar a festa e nós sabemos como os convidados são desajeitados. Vamos manter tudo em ordem!", doBem: true, poder: "Jogador extra. Nenhum.", icone: UIImage(named:"mae")!),
        
        Carta(nome: "Distraído", descricao: "Você quer ajudar, mas não consegue manter a boca fechada. Será que você vai acabar estragando a surpresa?", doBem: false, poder: "Caso os desorganizadores façam 3 pontos, poderá trocar de papel com o palhaço.", icone: UIImage(named:"desatento")!),
        
        Carta(nome: "Bêbado", descricao: "Você nem sabe o que está acontecendo, mas o importante é que estamos numa festa. Certo?", doBem: false, poder: "Você está tão bêbado que mal consegue andar. Quanto mais ter um poder.", icone: UIImage(named:"bebado")!),
        
        
<<<<<<< HEAD
        Carta(nome: "Palhaço", descricao: "Você foi contratado para animar a festa, mas quem disse que é isso que você vai fazer? Cada um por si.", doBem: false, poder: "Você não tem um poder, mas você não precisa disso")
    ]
    
    var instrucao = [
        Instrucao(nome: "Jogadores", instrucao: "O jogo poderá ser jogado entre 6 e 8 jogadores, o jogador poderá ser um organizador (simbolo rosa) ou um desorganizador (simbolo roxo) ou o palhaço, que possui o objetivo de atrapalhar os demais jogadores. "),
        Instrucao(nome: "Etapas", instrucao: "O jogo é composto por etapas, os organizadores possuem o objetivo de fazer que essas etapas sejam realizadas com sucesso, enquanto os desorganizadores irão fazer de tudo para fazer com que as etapas falhem e a festa seja mal sucedida."),
        Instrucao(nome: "Líder", instrucao: "O jogador não sabe  o papel dos demais jogadores, criando uma desconfiança entre eles. A cada rodada é escolhido um líder, esse líder é responsável por escolher 3 jogadores para realizar a etapa, os jogadores escolhidos votarão secretamente se a etapa falhará ou será um sucesso."),
        Instrucao(nome: "Casos", instrucao:"Caso os organizadores façam 4 pontos, o Penetra poderá ver a identidade do bêbado. Caso os desorganizadores façam 3 pontos, o Distraído poderá trocar de papel com o palhaço. "),
        Instrucao(nome: "Rodadas", instrucao: "O número de rodadas é a mesma quantidade de jogadores, possibilitando que cada jogadore se torne lider uma vez, assim que as rodadas acabarem, os organizadores devem apontar para quem eles acham que são os desorganizadores, lembrando que se o palhaço for o  mais votado ele ganha o jogo, e os desorganizadores devem apontar para os organizadores, tentando enganar todos e ganhar o jogo"),
        Instrucao(nome: "Final", instrucao: "Os organizadores ganham se descobrirem quem são os desorganizadores. Os desorganizadores ganham se enganarem todos para que votem nos organizadores. O palhaço ganha a maioria dos votos sejam nele.")
    ]
    
    var tarefas = [
        Tarefa(tituloTarefa: "O bolo precisa ser encomendado. Líder, escolha 3 jogadores para te ajudarem a escolher o sabor.", numeroTarefa: 1),
        Tarefa(tituloTarefa: "Os 37 barris de chopp chegaram. Líder, escolha 3 pessoas para ajudar a descarregar a bebida sem derramar nem uma gota.", numeroTarefa: 2),
        Tarefa(tituloTarefa: "A cama elástica é a principal atração. Líder, escolha 3 pessoas para te ajudarem a montar o brinquedo", numeroTarefa: 3),
        Tarefa(tituloTarefa: "o ambiente tem que estar perfeito. Líder, escolha X jogadores para te ajudarem a encher os balões.", numeroTarefa: 4),
        Tarefa(tituloTarefa: "Os vegetarianos também precisam comer. Líder, escolha 3 jogadores para te ajudem a lavar a  alface.", numeroTarefa: 5),
        Tarefa(tituloTarefa: "As crianças precisam brincar. Líder, escolha 3 jogadores para encher a piscina de bolinhas.", numeroTarefa: 6),
        Tarefa(tituloTarefa: "Os convidados chegaram. Líder, escolha 3 jogadores para ajudar a estacionar os carros. ", numeroTarefa: 7),
        Tarefa(tituloTarefa: "As mesas precisam ser arrumadas. Líder, escolha 3 jogadores para ajudar a arrumar as mesas. ", numeroTarefa: 8),
        Tarefa(tituloTarefa: "As comidas chegaram. Líder, escolha 3 jogadores para ajudar a organizar as comidas.", numeroTarefa: 9),
        Tarefa(tituloTarefa: "Os convidados estão com sede. Líder, escolha 3 jogadores para ajudar a servir bebida.", numeroTarefa: 10),
        Tarefa(tituloTarefa: "O aniversariante está preso no banheiro. Líder, escolha 3 jogadores para ajudar a soltar o aniversariante.", numeroTarefa: 11),
        Tarefa(tituloTarefa: "As cadeiras estão sujas. Líder, escolha 3 jogadores para limpar as cadeiras.", numeroTarefa: 12),
        Tarefa(tituloTarefa: "Ninguém sabe onde está a comida. Líder, escolha 3 jogadores para ajudar a encontrar a comida.", numeroTarefa: 13),
        Tarefa(tituloTarefa: "As garrafas de Refrigerante estão quentes. Líder, escolha 3 jogadores para colocar o refrigerante na geladeira", numeroTarefa: 14),
        Tarefa(tituloTarefa: "Os salgadinhos estão acabando. Líder, escolha 3 jogadores para comprar mais salgadinhos", numeroTarefa: 15),
        Tarefa(tituloTarefa: "A roupa do aniversariante sujou. Líder, escolha 3 jogadores para ajudar o aniversariante", numeroTarefa: 16),
        Tarefa(tituloTarefa: "A cozinha está pegando fogo. Líder, escolha 3 jogadores para apagar o fogo", numeroTarefa: 17),
        Tarefa(tituloTarefa: "O banheiro entupiu. Líder, escolha 3 jogadores para limpar o banheiro ", numeroTarefa: 18),
        Tarefa(tituloTarefa: "A luz caiu. Líder, escolha 3 jogadores para religar o disjuntor ", numeroTarefa: 19),
        Tarefa(tituloTarefa: "A música parou. Líder, escolha 3 jogadores para colocar uma música ", numeroTarefa: 20),
        Tarefa(tituloTarefa: "Os convidados estão odiando a musica. Líder, escolha 3 jogadores para trocar a música ", numeroTarefa: 21)
    ]
    
    
=======
        Carta(nome: "Palhaço", descricao: "Você foi contratado para animar a festa, mas quem disse que é isso que você vai fazer? Cada um por si.", doBem: false, poder: "Você não tem um poder, mas você não precisa disso.", icone: UIImage(named:"palhaco copy 3")!)
        
        
            
    ]
    
    var tarefas = [
        Tarefa(tituloTarefa: "O bolo precisa ser encomendado. Líder, escolha X jogadores para te ajudarem a escolher o sabor.", numeroTarefa: 1),
        Tarefa(tituloTarefa: "Os 37 barris de chopp chegaram. Líder, escolha X pessoas para ajudar a descarregar a bebida sem derramar nem uma gota.", numeroTarefa: 2),
        Tarefa(tituloTarefa: "A cama elástica é a principal atração. Líder, escolha X pessoas para te ajudarem a montar o brinquedo", numeroTarefa: 3),
        Tarefa(tituloTarefa: "o ambiente tem que estar perfeito. Líder, escolha X jogadores para te ajudarem a encher os balões.", numeroTarefa: 4),
        Tarefa(tituloTarefa: "Os vegetarianos também precisam comer. Líder, escolha X jogadores para te ajudem a lavar a  alface.", numeroTarefa: 5),
        Tarefa(tituloTarefa: "As crianças precisam brincar, ajude a encher as piscina de bolinhas", numeroTarefa: 6)
    ]
>>>>>>> Mafe
    private init(){}
}
