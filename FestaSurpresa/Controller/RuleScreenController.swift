import UIKit
import SpriteKit


class RuleScreenController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var stackMenu: UIStackView!
    @IBOutlet weak var btnPersonagens: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var llbTituloPoder: UILabel!
    @IBOutlet weak var lblPoder: UILabel!
    @IBOutlet weak var viewSk: SKView!
    @IBOutlet weak var btnInstrucoes: UIButton!
    @IBOutlet weak var btnSair: UIButton!
    @IBOutlet weak var lblNomeJogador: UILabel!
    @IBOutlet weak var lblDescricao: UILabel!
    @IBOutlet weak var btnDistraido: UIButton!
    @IBOutlet weak var btnParceiro: UIButton!
    @IBOutlet weak var btnPai: UIButton!
    @IBOutlet weak var btnNamorado: UIButton!
    @IBOutlet weak var bntBebado: UIButton!
    @IBOutlet weak var btnPenetra: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btnPalhaco: UIButton!
    @IBOutlet weak var btnMenuJogador: UIButton!
    @IBOutlet weak var btnMenuEtapas: UIButton!
    @IBOutlet weak var btnMenuCasos: UIButton!
    @IBOutlet weak var btnMenuRodadas: UIButton!
    @IBOutlet weak var btnMenuLider: UIButton!
    @IBOutlet weak var btnMenuFinal: UIButton!
    
    
    
    var escolhido = 0
    
    func esconder(esco:Int){
        lblDescricao.font = lblDescricao.font.withSize(25)
        UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
                    self.btnSair.alpha = 1
                    self.stackView.alpha = 0
                    self.lblDescricao.alpha = 1
                    self.lblPoder.alpha = 0
        //            self.lblNomeJogador.alpha = 0
                    self.llbTituloPoder.alpha = 0
                    self.stackMenu.alpha = 0
                    
                }, completion: { _ in
                    self.stackMenu.isHidden = true
                    self.btnSair.isHidden = false
                    self.stackView.isHidden = true
                    self.lblDescricao.isHidden = false
                    self.lblPoder.isHidden = true
        //            self.lblNomeJogador.isHidden = true
                    self.llbTituloPoder.isHidden = true
                    self.lblNomeJogador.text = "Instruções"
                    self.stackMenu.isHidden = false
                    self.lblNomeJogador.layer.borderWidth = 2
                    self.lblNomeJogador.layer.cornerRadius = 5
                    self.lblNomeJogador.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    self.lblDescricao.text = Model.shared.instrucao[esco]
                    
                })
    }
    
    @IBAction func actBtnMenuJogador(_ sender: Any) {
        print("jogador")
        esconder(esco: 0)
    }
    @IBAction func actBtnMenuEtapa(_ sender: Any) {
         esconder(esco: 1)
    }
    @IBAction func actBtnMenuRodadas(_ sender: Any) {
         esconder(esco: 2)
    }
    @IBAction func actBtnMenuCasos(_ sender: Any) {
         esconder(esco: 3)
    }
    @IBAction func actBtnMenuLider(_ sender: Any) {
         esconder(esco: 4)
        lblDescricao.font = lblDescricao.font.withSize(18)
    }
    @IBAction func actBtnMenuFinal(_ sender: Any) {
         esconder(esco: 5)
    }
    
    
    
    @IBAction func actBtnPersonagens(_ sender: Any) {
        
        btnInstrucoes.layer.borderWidth = 1
        btnInstrucoes.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        btnInstrucoes.backgroundColor = .clear
        btnInstrucoes.setTitleColor(.black, for: .normal)
        btnPersonagens.backgroundColor = .black
        btnPersonagens.setTitleColor(.white, for: .normal)
        mostrar()
    }
    
    
    @IBAction func actBtnPalhaco(_ sender: Any) {
        mostrar()
        escolhido = 7
        lblNomeJogador.text = Model.shared.cartas[7].nome
        lblDescricao.text = Model.shared.cartas[7].descricao
        lblPoder.text = Model.shared.cartas[7].poder
    }
    @IBAction func actBtnPenetra(_ sender: Any) {
        mostrar()
        escolhido = 2
        lblNomeJogador.text = Model.shared.cartas[2].nome
        lblDescricao.text = Model.shared.cartas[2].descricao
        lblPoder.text = Model.shared.cartas[2].poder
    }
    @IBAction func actBtnBebado(_ sender: Any) {
        mostrar()
        escolhido = 4
        lblNomeJogador.text = Model.shared.cartas[4].nome
        lblDescricao.text = Model.shared.cartas[4].descricao
        lblPoder.text = Model.shared.cartas[4].poder
    }
    
    @IBAction func actBtnDistraido(_ sender: Any) {
        mostrar()
        escolhido = 5
         lblNomeJogador.text = Model.shared.cartas[5].nome
        lblDescricao.text = Model.shared.cartas[5].descricao
        lblPoder.text = Model.shared.cartas[5].poder
    }
    @IBAction func actBtnNamorado(_ sender: Any) {
        mostrar()
        escolhido = 0
        lblNomeJogador.text = Model.shared.cartas[0].nome
        lblDescricao.text = Model.shared.cartas[0].descricao
        lblPoder.text = Model.shared.cartas[0].poder
    }
    @IBAction func actBtnPai(_ sender: Any) {
        mostrar()
        escolhido = 3
        lblNomeJogador.text = Model.shared.cartas[3].nome
        lblDescricao.text = Model.shared.cartas[3].descricao
        lblPoder.text = Model.shared.cartas[3].poder
    }
    
    @IBAction func actBtnSair(_ sender: Any) {
        mostrar()
    }
    @IBAction func actBtnParceiro(_ sender: Any) {
        mostrar()
        escolhido = 1
         lblNomeJogador.text = Model.shared.cartas[1].nome
         lblDescricao.text = Model.shared.cartas[1].descricao
        lblPoder.text = Model.shared.cartas[1].poder
    }
    func mostrar(){
        btnInstrucoes.layer.borderWidth = 1
        btnInstrucoes.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        btnInstrucoes.backgroundColor = .clear
        btnInstrucoes.setTitleColor(.black, for: .normal)
        btnPersonagens.backgroundColor = .black
        btnPersonagens.setTitleColor(.white, for: .normal)
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            self.stackMenu.alpha = 0
            self.btnSair.alpha = 0
            self.stackView.alpha = 1
            self.lblDescricao.alpha = 1
            self.lblPoder.alpha = 1
            self.lblNomeJogador.alpha = 1
            self.llbTituloPoder.alpha = 1
            
        }, completion: { _ in
            self.stackMenu.isHidden = true
           self.stackView.isHidden = false
            self.lblDescricao.isHidden = false
            self.lblPoder.isHidden = false
            self.stackMenu.isHidden = false
            self.lblNomeJogador.isHidden = false
            self.llbTituloPoder.isHidden = false
            self.lblNomeJogador.text = Model.shared.cartas[self.escolhido].nome
            self.lblDescricao.text = Model.shared.cartas[self.escolhido].descricao
            self.lblNomeJogador.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            self.lblDescricao.font = self.lblDescricao.font.withSize(25)

        })
    }
    @IBAction func actBtnInstrucao(_ sender: Any) {
        btnPersonagens.layer.borderWidth = 1
        btnPersonagens.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        btnInstrucoes.backgroundColor = .black
        btnInstrucoes.setTitleColor(.white, for: .normal)
        btnPersonagens.backgroundColor = .clear
        btnPersonagens.setTitleColor(.black, for: .normal)
        UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
//            self.btnSair.alpha = 1
            self.stackView.alpha = 0
            self.lblDescricao.alpha = 0
            self.lblPoder.alpha = 0
//            self.lblNomeJogador.alpha = 0
            self.llbTituloPoder.alpha = 0
            self.stackMenu.alpha = 1
            
        }, completion: { _ in
//            self.btnSair.isHidden = false
            self.stackView.isHidden = true
            self.lblDescricao.isHidden = true
            self.lblPoder.isHidden = true
//            self.lblNomeJogador.isHidden = true
            self.llbTituloPoder.isHidden = true
            self.lblNomeJogador.text = "Instruções"
            self.stackMenu.isHidden = false
            self.lblNomeJogador.layer.borderWidth = 2
            self.lblNomeJogador.layer.cornerRadius = 5
            self.lblNomeJogador.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.lblDescricao.text = Model.shared.instrucao[0]
            
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNomeJogador.text = Model.shared.cartas[2].nome
        lblDescricao.text = Model.shared.cartas[2].descricao
        lblPoder.text = Model.shared.cartas[2].poder
        if let scene = SKScene(fileNamed: "VerticalScene") {
            scene.scaleMode = .aspectFill
            viewSk.presentScene(scene)
        }
        stackMenu.isHidden = true
        mainView.backgroundColor = UIColor.clear
        let colors = Colors()
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        mainView.layer.insertSublayer(backgroundLayer!, at: 0)
        contentView.layer.cornerRadius = 15.0
        contentView.alpha = 0.8
        btnSair.layer.cornerRadius = 3
        btnSair.isHidden = true
        btnInstrucoes.layer.cornerRadius = 3
        btnPersonagens.layer.cornerRadius = 3
        btnInstrucoes.setTitleColor(.black, for: .normal)
        btnInstrucoes.layer.borderWidth = 1
        btnInstrucoes.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        btnPersonagens.setTitleColor(.white, for: .normal)
        btnPersonagens.backgroundColor = .black
        btnSair.isHidden = true
    }
}
