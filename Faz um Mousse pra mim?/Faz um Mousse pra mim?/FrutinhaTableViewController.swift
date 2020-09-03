//
//  FrutinhaTableViewController.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 31/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

class FrutinhaTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    var frutinhas = [Frutinha]()
    var fruity: [Fruity] = []
//    
//    //MARK: Private Methods
//    public func loadSampleFrutinhas(){
//        let fotoLimao = UIImage(named: "limao-1") ??  UIImage()
//        let fotoMorango = UIImage(named: "morando-1") ?? UIImage()
//        let fotoMaracuja = UIImage(named: "maracujasemente-1") ?? UIImage()
//        
//        let limao = Frutinha(fotoFrutinha: fotoLimao, nomeDaFrutinha: "Limão", familiaDaFrutinha: "", generoDaFrutinha: "", ordemDaFrutinha: "", carboidratosDaFrutinha: 0, proteinasDaFrutinha: 0, gordurasDaFrutinha: 0, caloriasDaFrutinha: 0, acucaresDaFrutinha: 0)
//        
//        let morango = Frutinha(fotoFrutinha: fotoMorango, nomeDaFrutinha: "Morango", familiaDaFrutinha: "", generoDaFrutinha: "", ordemDaFrutinha: "", carboidratosDaFrutinha: 0, proteinasDaFrutinha: 0, gordurasDaFrutinha: 0, caloriasDaFrutinha: 0, acucaresDaFrutinha: 0)
//        
//        let maracuja = Frutinha(fotoFrutinha: fotoMaracuja, nomeDaFrutinha: "Maracujá", familiaDaFrutinha: "", generoDaFrutinha: "", ordemDaFrutinha: "", carboidratosDaFrutinha: 0, proteinasDaFrutinha: 0, gordurasDaFrutinha: 0, caloriasDaFrutinha: 0, acucaresDaFrutinha: 0)
//        
//        frutinhas += [maracuja, morango, limao]
//    }
//    
//    public func load() {
//        // TODO: Carregar dados do webservice
//        let url = URL(string: "https://www.fruityvice.com/api/fruit/all")!
//        let task = URLSession.shared.dataTask(with: url){data, response, error in
//            do{
//                let fruity = try JSONDecoder().decode([Fruity].self, from: data!)
//                self.fruity = fruity
//                self.frutinhas[2].familiaDaFrutinha = fruity[4].family
//                self.frutinhas[2].generoDaFrutinha = fruity[4].genus
//                self.frutinhas[2].ordemDaFrutinha = fruity[4].order
//                self.frutinhas[2].carboidratosDaFrutinha = fruity[4].nutritions.carbohydrates
//                self.frutinhas[2].proteinasDaFrutinha = fruity[4].nutritions.protein
//                self.frutinhas[2].gordurasDaFrutinha = fruity[4].nutritions.fat
//                self.frutinhas[2].caloriasDaFrutinha = fruity[4].nutritions.calories
//                self.frutinhas[2].acucaresDaFrutinha = fruity[4].nutritions.sugar
//                
//                self.frutinhas[1].familiaDaFrutinha = fruity[10].family
//                self.frutinhas[1].generoDaFrutinha = fruity[10].genus
//                self.frutinhas[1].ordemDaFrutinha = fruity[10].order
//                self.frutinhas[1].carboidratosDaFrutinha = fruity[10].nutritions.carbohydrates
//                self.frutinhas[1].proteinasDaFrutinha = fruity[10].nutritions.protein
//                self.frutinhas[1].gordurasDaFrutinha = fruity[10].nutritions.fat
//                self.frutinhas[1].caloriasDaFrutinha = fruity[10].nutritions.calories
//                self.frutinhas[1].acucaresDaFrutinha = fruity[10].nutritions.sugar
//                
//                self.frutinhas[0].familiaDaFrutinha = "Passifloraceae"
//                self.frutinhas[0].generoDaFrutinha = "Passiflora"
//                self.frutinhas[0].ordemDaFrutinha = "Malpighiales"
//                self.frutinhas[0].carboidratosDaFrutinha = 23
//                self.frutinhas[0].proteinasDaFrutinha = 2.2
//                self.frutinhas[0].gordurasDaFrutinha = 0.7
//                self.frutinhas[0].caloriasDaFrutinha = 97
//                self.frutinhas[0].acucaresDaFrutinha = 11
//                
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }catch{
//                print("deu não")
//            }
//            
//        }.resume()
//        
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Load the sample data
//        loadSampleFrutinhas()
//        self.load()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //        tableView.register(FrutinhaTableViewCell.self, forCellReuseIdentifier: "FrutinhaTableViewCell")
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 534
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table views cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "FrutinhaTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FrutinhaTableViewCell else { fatalError("The dequeued cell is not an instance of FrutinhaTableViewCell.")}
        
        // Fetches the appropriate frutinha for the data source layout
        let frutinha = frutinhas[indexPath.row]
        
        cell.imageFrutinha.image = frutinha.fotoFrutinha
        cell.nomeFrutinha.text = frutinha.nomeDaFrutinha
        cell.familiaFrutinha.text = frutinha.familiaDaFrutinha
        cell.generoFrutinha.text = frutinha.generoDaFrutinha
        cell.ordemFrutinha.text = frutinha.ordemDaFrutinha
        cell.carboidratosFrutinha.text = String(frutinha.carboidratosDaFrutinha)
        cell.proteinasFrutinha.text = String(frutinha.proteinasDaFrutinha)
        cell.gordurasFrutinha.text = String(frutinha.gordurasDaFrutinha)
        cell.caloriasFrutinha.text = String(frutinha.caloriasDaFrutinha)
        cell.acucaresFrutinha.text = String(frutinha.acucaresDaFrutinha)
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
