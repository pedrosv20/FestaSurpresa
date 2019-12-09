//
//  Model.swift
//  FestaSurpresa
//
//  Created by Mateus Nunes on 05/12/19.
//  Copyright © 2019 Aoba. All rights reserved.
//

import Foundation
import UIKit

class Model {
    
    static let shared = Model()
    
    private init(){}
    
    var players: [Player] = []
    
    var cartas = [
        Carta(nome: "Namorado", descricao: "Chegou a hora de mostrar todo seu amor. Você está no comando da organização e o sucesso dessa festa (e consequentemente a felicidade do(a) seu amado(a)) dependem de você.", doBem: true, poder: "", icone: UIImage(named:"namorado")),

        Carta(nome: "Melhor amigo", descricao: "Você sabe o quanto seu amigo sempre desejou uma festa dessas. Não vamos decepcioná-lo, né?", doBem: true, poder: "", icone: UIImage(named:"amigo")),

        Carta(nome: "Penetra", descricao: "Você já veio para a festa sem ser convidado. O mínimo que pode fazer é ajudar", doBem: true, poder: "", icone: UIImage(named:"penetra")),

        Carta(nome: "Pai", descricao: "Você precisa controlar a organização da festa para que a festa dê certo e, mais importante, sua casa não termine destruída.", doBem: true, poder: "", icone: UIImage(named:"pai")),

        Carta(nome: "Mãe", descricao: "É necessário organizar a festa e nós sabemos como os convidados são desajeitados. Vamos manter tudo em ordem!", doBem: true, poder: "", icone: UIImage(named:"mae")),

        Carta(nome: "Distraído", descricao: "Você quer ajudar, mas não consegue manter a boca fechada. Será que você vai acabar estragando a surpresa?", doBem: false, poder: "", icone: UIImage(named:"distraído")),

        Carta(nome: "Bêbado", descricao: "Você nem sabe o que está acontecendo, mas o importante é que estamos numa festa. Certo?", doBem: false, poder: "", icone: UIImage(named:"bebado")),

        Carta(nome: "Vizinho", descricao: "Você foi convidado para ajudar a festa, então dê o seu máximo para ajudar seus querido vizinho", doBem: false, poder: "", icone: UIImage(named:"VizinhoIcone") )

    ]

    var instrucao = [
        Instrucao(nome: "Jogadores", instrucao: "O número de jogadores é entre 6 e 8. Há duas equipes: os Organizadores (simbolo vermelho) e os Desorganizadores (simbolo roxo). Os jogadores não sabem o papel dos demais, criando uma desconfiança entre eles."),
        Instrucao(nome: "Rodadas", instrucao: "A cada rodada, uma etapa da festa será organizada. 3 jogadores são escolhidos para auxiliar. Estes jogadores podem ajudar ou atarapalhar a rodada. Se houverem 3 votos de ajuda, a rodada terá sucesso e os Organizadores fazem 1 ponto. Caso contrário, o ponto vai para os Desorganizadores."),
        Instrucao(nome: "Líder", instrucao: "Cada rodada possui líder, que é responsável por selecionar 3 jogadores para participar da rodada, votando secretamente se a etapa falhará ou será um sucesso."),
        Instrucao(nome: "Bêbado", instrucao:"O bebado nunca consegue escolher seu voto. Assim, quando participa da rodada, seu voto é aleatório."),
        Instrucao(nome: "Rodadas", instrucao: "Serão 7 rodadas ao todo para tentar preparar a festa."),
        Instrucao(nome: "Final", instrucao: "Se 4 rodadas falharem, os Desorganizadores ganham. Se 4 rodadas forem bem sucedidas, os Organizadores ganham.")
    ]
    
    var tarefas = [
        Tarefa(tituloTarefa: "O bolo precisa ser encomendado. Escolha 3 jogadores para te ajudarem a escolher o sabor.", numeroTarefa: 1),
        Tarefa(tituloTarefa: "Os 37 barris de chopp chegaram. Escolha 3 pessoas para ajudar a descarregar a bebida sem derramar nem uma gota.", numeroTarefa: 2),
        Tarefa(tituloTarefa: "A cama elástica é a principal atração. Líder, escolha 3 pessoas para te ajudarem a montar o brinquedo", numeroTarefa: 3),
        Tarefa(tituloTarefa: "O ambiente tem que estar perfeito. Escolha X jogadores para te ajudarem a encher os balões.", numeroTarefa: 4),
        Tarefa(tituloTarefa: "Os vegetarianos também precisam comer. Escolha 3 jogadores para te ajudem a lavar a  alface.", numeroTarefa: 5),
        Tarefa(tituloTarefa: "As crianças precisam brincar. Escolha 3 jogadores para encher a piscina de bolinhas.", numeroTarefa: 6),
        Tarefa(tituloTarefa: "Os convidados chegaram. Escolha 3 jogadores para ajudar a estacionar os carros.", numeroTarefa: 7),
        Tarefa(tituloTarefa: "As mesas precisam ser arrumadas. Escolha 3 jogadores para ajudar a arrumar as mesas.", numeroTarefa: 8),
        Tarefa(tituloTarefa: "A comida chegou. Escolha 3 jogadores para ajudar a servir.", numeroTarefa: 9),
        Tarefa(tituloTarefa: "Os convidados estão com sede. Escolha 3 jogadores para preparaem shots.", numeroTarefa: 10),
        Tarefa(tituloTarefa: "O aniversariante está preso no banheiro. Escolha 3 jogadores para ajudar a soltar o aniversariante.", numeroTarefa: 11),
        Tarefa(tituloTarefa: "As cadeiras estão sujas. Líder, escolha 3 jogadores para limpar as cadeiras.", numeroTarefa: 12),
        Tarefa(tituloTarefa: "Ninguém sabe onde está a comida. Escolha 3 jogadores para ajudar a encontrar a comida.", numeroTarefa: 13),
        Tarefa(tituloTarefa: "Os refrigerantes estão quentes. Escolha 3 jogadores para comprar gelo.", numeroTarefa: 14),
        Tarefa(tituloTarefa: "Os salgadinhos estão acabando. Escolha 3 jogadores para assar mais salgadinhos.", numeroTarefa: 15),
        Tarefa(tituloTarefa: "O aniversariante caiu numa poça de lama. Escolha 3 jogadores para dar banho no aniversariante.", numeroTarefa: 16),
        Tarefa(tituloTarefa: "A cozinha está pegando fogo. Escolha 3 jogadores para controlar o incêndio.", numeroTarefa: 17),
        Tarefa(tituloTarefa: "O banheiro entupiu. Escolha 3 jogadores para limpar o banheiro ", numeroTarefa: 18),
        Tarefa(tituloTarefa: "A luz caiu. Escolha 3 jogadores para religar o disjuntor ", numeroTarefa: 19),
        Tarefa(tituloTarefa: "A música parou. Escolha 3 jogadores para serem DJs.", numeroTarefa: 20),
        Tarefa(tituloTarefa: "Os convidados estão odiando a musica e destruíndo a casa. Escolha 3 jogadores para trocar a playlist.", numeroTarefa: 21)
    ]
    
    
    
}
