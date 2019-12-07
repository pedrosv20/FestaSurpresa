import UIKit
import SpriteKit


class RuleScreenController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
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
        print("Index Carregado \(indexPath.item)\n Conteudo = \(Model.shared.cartas[indexPath.item].nome)")
        if escolhido == 1{
            if ((indexCarregado % 2) == 0 && !primeiro){
                print("esquerda \n")
                celula = tableView.dequeueReusableCell(withIdentifier: "Celula", for: indexPath) as! Celula
//                celula.nomeCarta.leadingAnchor.constraint(equalTo:celula.img.trailingAnchor,constant: 10).isActive = true
            }
            else {
                print("direita \n")
                celula = tableView.dequeueReusableCell(withIdentifier: "CelulaTipoDois", for: indexPath) as! Celula
//                celula.nomeCarta.trailingAnchor.constraint(equalTo:celula.img.leadingAnchor,constant: -10).isActive = true
                
            }
            celula.descPoder.isHidden = false
            celula.img.isHidden = false
            celula.descCarta.text = Model.shared.cartas[indexPath.item].descricao
            celula.nomeCarta.text = Model.shared.cartas[indexPath.item].nome
            celula.descPoder.text = Model.shared.cartas[indexPath.item].poder
            celula.img.image = Model.shared.cartas[indexPath.item].icone
        }
        else{
            if ((indexCarregado % 2) == 0 && !primeiro) {
                print("esquerda \n")
                celula = tableView.dequeueReusableCell(withIdentifier: "Celula", for: indexPath) as! Celula
//                celula.nomeCarta.leadingAnchor.constraint(equalTo:celula.descCarta.leadingAnchor).isActive = true
           }
           else{
                print("direita \n")
               celula = tableView.dequeueReusableCell(withIdentifier: "CelulaTipoDois", for: indexPath) as! Celula
   
//                celula.nomeCarta.trailingAnchor.constraint(equalTo:celula.descCarta.trailingAnchor).isActive = true
           }
            celula.descPoder.isHidden = true
            celula.img.isHidden = true
            celula.descCarta.text = Model.shared.instrucao[indexPath.item].instrucao
            celula.nomeCarta.text =  Model.shared.instrucao[indexPath.item].nome
        }
        primeiro = false
        return celula
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var Instrucao: UIButton!
    @IBOutlet weak var btnPersonagem: UIButton!
    var escolhido = 1
    var primeiro = true
    var celula : Celula!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var sairButton: UIButton!
    
    
    
    
    @IBAction func sairButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller  = storyboard.instantiateInitialViewController()!
        controller.modalPresentationStyle = .overFullScreen
        
        DispatchQueue.main.async {
            
            self.present(controller, animated: false, completion: nil)
        }
        
    }
    var indexCarregado = 0
    @IBAction func actBtnInstrucao(_ sender: Any) {
        primeiro = true
        self.escolhido = 2
        self.tableView.reloadData()
        btnPersonagem.backgroundColor = .clear
        btnPersonagem.setTitleColor(.black, for: .normal)
        Instrucao.backgroundColor = .black
        Instrucao.setTitleColor(.white, for: .normal)
        mainView.layer.borderColor = #colorLiteral(red: 1, green: 0.2981306969, blue: 0.6780996653, alpha: 1)
        mainView.layer.borderWidth = 2
    }
    @IBAction func actBtnPersonagem(_ sender: Any) {
         primeiro = true
        self.tableView.reloadData()
        self.escolhido = 1
        Instrucao.backgroundColor = .clear
        Instrucao.setTitleColor(.black, for: .normal)
        btnPersonagem.backgroundColor = .black
        btnPersonagem.setTitleColor(.white, for: .normal)
        mainView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
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
        contentView.backgroundColor = #colorLiteral(red: 0.9989697337, green: 0.901548326, blue: 0.627599597, alpha: 1)
//        mainView.layer.borderWidth = 2
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 14
        sairButton.layer.cornerRadius = 5
        mainView.alpha = 0.8
    }
}
class Celula:UITableViewCell{
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nomeCarta: UILabel!
    @IBOutlet weak var descCarta: UILabel!
    @IBOutlet weak var descPoder: UILabel!
    
}

