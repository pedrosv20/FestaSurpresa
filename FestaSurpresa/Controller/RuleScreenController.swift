import UIKit
import SpriteKit


class RuleScreenController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("index Carregado \(indexPath.item)")
        self.indexCarregado = indexPath.item
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if escolhido == 1{
            return Model.shared.cartas.count
        }else{
            return Model.shared.instrucao.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if escolhido == 1{
            if ((indexCarregado % 2) == 0){
                celula = tableView.dequeueReusableCell(withIdentifier: "Celula", for: indexPath) as! Celula
            }
            else {
                celula = tableView.dequeueReusableCell(withIdentifier: "CelulaTipoDois", for: indexPath) as! Celula
            }
            celula.descPoder.isHidden = false
            celula.descCarta.text = Model.shared.cartas[indexPath.item].descricao
            celula.nomeCarta.text = Model.shared.cartas[indexPath.item].nome
            celula.descPoder.text = Model.shared.cartas[indexPath.item].poder
            cont += 1
            if cont >= 8{
                cont = 0
            }
        }
        else{
            if ((cont % 2) == 0) {
               celula = tableView.dequeueReusableCell(withIdentifier: "Celula", for: indexPath) as! Celula
           }
           else{
               celula = tableView.dequeueReusableCell(withIdentifier: "CelulaTipoDois", for: indexPath) as! Celula
           }
           celula.descPoder.isHidden = true
            celula.descCarta.text = Model.shared.instrucao[indexPath.item].instrucao
            celula.nomeCarta.text =  Model.shared.instrucao[indexPath.item].nome
            cont += 1
            if cont >= 6{
                cont = 0
            }
        }
        
        return celula
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var Instrucao: UIButton!
    @IBOutlet weak var btnPersonagem: UIButton!
    var escolhido = 1
    var cont = 0
    var celula : Celula!
    @IBOutlet weak var mainView: UIView!
    var indexCarregado = 0
    @IBAction func actBtnInstrucao(_ sender: Any) {
        
        self.escolhido = 2
        self.tableView.reloadData()
        cont = 0
        btnPersonagem.backgroundColor = .clear
        btnPersonagem.setTitleColor(.black, for: .normal)
        Instrucao.backgroundColor = .black
        Instrucao.setTitleColor(.white, for: .normal)
    }
    @IBAction func actBtnPersonagem(_ sender: Any) {
        self.tableView.reloadData()
        cont = 0
        self.escolhido = 1
        Instrucao.backgroundColor = .clear
        Instrucao.setTitleColor(.black, for: .normal)
        btnPersonagem.backgroundColor = .black
        btnPersonagem.setTitleColor(.white, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        btnPersonagem.backgroundColor = .black
        btnPersonagem.setTitleColor(.white, for: .normal)
        btnPersonagem.layer.cornerRadius = 5
        btnPersonagem.layer.borderWidth = 1
        Instrucao.layer.borderWidth = 1
        Instrucao.layer.cornerRadius = 5
        mainView.layer.borderWidth = 2
        mainView.layer.cornerRadius = 14
    }
}
class Celula:UITableViewCell{
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nomeCarta: UILabel!
    @IBOutlet weak var descCarta: UILabel!
    @IBOutlet weak var descPoder: UILabel!
    
}

