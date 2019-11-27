class Model
{
    static let shared = Model()
    
    
//    var cartasMal = Model.shared.cartas.filter({$0.doBem == false})
//    var cartasBem = Model.shared.cartas.filter({$0.doBem})
    var cartas = [
        Carta(nome: "Namorado", descricao: "Chegou a hora de mostrar todo seu amor. Você está no comando da organização e o sucesso dessa festa (e consequentemente a felicidade do(a) seu amado(a)) dependem de você.", doBem: true,poder: "Trocar de papel com qualquer jogador, em dado momento da festa"),
        
        Carta(nome: "Melhot amigo", descricao: "Você sabe o quanto seu amigo sempre desejou uma festa dessas. Não vamos decepcioná-lo, né?", doBem: true,poder: "Olhar o papel de qualquer outro jogador, em dado momento da festa"),
        
        Carta(nome: "Penetra", descricao: "Você já veio para a festa sem ser convidado. O mínimo que pode fazer é ajudar", doBem: true, poder: "Caso os organizadores façam 4 pontos, você pode ver a identidade do bêbado"),
        
        Carta(nome: "Pai", descricao: "Você precisa controlar a organização da festa para que a festa dê certo e, mais importante, sua casa não termine destruída", doBem: true, poder: "Nenhum"),
        
        Carta(nome: "Tia", descricao: "faz tempo que você não vê seu querido(a) sobrinho, ajudá-lo(a) com a festa seria uma boa oportunidade para revê-lo(a)", doBem: true, poder: "Nenhum"),
        
        Carta(nome: "Primo", descricao: "Você e o(a) aniversariante brincavam muito quando eram crianças, ajude ele(a) a organizar a festa, e se divirta!", doBem: true, poder: "Nenhum"),
        
        Carta(nome: "Mãe", descricao: "Junto com seu marido é necessário organizar a festa, nós sabemos como os convidados são desajeitados, é importante manter tudo em ordem!", doBem: true, poder: "Nenhum"),
        
        Carta(nome: "Distraído", descricao: "Você quer ajudar, mas não consegue manter a boca fechada. Será que você vai acabar estragando a surpresa?", doBem: false, poder: "Caso os desorganizadores façam 3 pontos, poderá trocar de papel com o palhaço."),
        
        Carta(nome: "Bêbado", descricao: "Você nem sabe o que está acontecendo, mas o importante é que estamos numa festa. Certo?", doBem: false, poder: "Você está tão bêbado que mal consegue andar. Quanto mais ter um poder.")
            
    ]
    private init(){}
}
