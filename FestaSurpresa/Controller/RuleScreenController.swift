import UIKit
import SpriteKit


class RuleScreenController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var lblPoder: UILabel!
    @IBOutlet weak var viewSk: SKView!
    
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
    
    @IBAction func actBtnPalhaco(_ sender: Any) {
        lblNomeJogador.text = Model.shared.cartas[7].nome
        lblDescricao.text = Model.shared.cartas[7].descricao
        lblPoder.text = Model.shared.cartas[7].poder
    }
    @IBAction func actBtnPenetra(_ sender: Any) {
        lblNomeJogador.text = Model.shared.cartas[2].nome
        lblDescricao.text = Model.shared.cartas[2].descricao
        lblPoder.text = Model.shared.cartas[2].poder
    }
    @IBAction func actBtnBebado(_ sender: Any) {
        lblNomeJogador.text = Model.shared.cartas[4].nome
        lblDescricao.text = Model.shared.cartas[4].descricao
        lblPoder.text = Model.shared.cartas[4].poder
    }
    
    @IBAction func actBtnDistraido(_ sender: Any) {
         lblNomeJogador.text = Model.shared.cartas[5].nome
               lblDescricao.text = Model.shared.cartas[5].descricao
        lblPoder.text = Model.shared.cartas[5].poder
    }
    @IBAction func actBtnNamorado(_ sender: Any) {
        lblNomeJogador.text = Model.shared.cartas[0].nome
        lblDescricao.text = Model.shared.cartas[0].descricao
        lblPoder.text = Model.shared.cartas[0].poder
    }
    @IBAction func actBtnPai(_ sender: Any) {
        lblNomeJogador.text = Model.shared.cartas[3].nome
        lblDescricao.text = Model.shared.cartas[3].descricao
        lblPoder.text = Model.shared.cartas[3].poder
    }
    
    @IBAction func actBtnParceiro(_ sender: Any) {
         lblNomeJogador.text = Model.shared.cartas[1].nome
         lblDescricao.text = Model.shared.cartas[1].descricao
        lblPoder.text = Model.shared.cartas[1].poder
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
        
        mainView.backgroundColor = UIColor.clear
        let colors = Colors()
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        mainView.layer.insertSublayer(backgroundLayer!, at: 0)
        contentView.layer.cornerRadius = 15.0
        contentView.alpha = 0.8
    }
}
