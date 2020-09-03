//
//  ViewController.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 27/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

 class ViewController: UIViewController {
    
    
    @IBOutlet weak var buttonInicial: UIButton!
    
    @IBOutlet weak var viewNome: UIView!
    
    @IBOutlet weak var nome: UIImageView!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    @IBAction func buttonInicial(_ sender: Any) {}
    
    
    @IBAction func tapInicial(_ sender: Any) {
        
        //        UIView.animate (withDuration: 2.0, delay: 0, animations: {
        //
        //                   self.viewNome.center = self.view.center })
        //
        //
        //               UIView.animate (withDuration: 2, delay: 0,  animations: {
        //
        //                   self.view.backgroundColor = .black
        //                   self.view.backgroundColor = .white })
        //
        //          buttonInicial.isHidden = false
    }
    
    func animacaoInicial() {
        UIView.animate (withDuration: 2.0, delay: 0, animations: {
            
            self.viewNome.center = self.view.center })
        
        
        UIView.animate (withDuration: 2, delay: 0,  animations: {
            
            self.view.backgroundColor = .black
            self.view.backgroundColor = .white })
        
        buttonInicial.isHidden = false
    }
    
    var frutinhas = [Frutinha]()
    var fruity: [Fruity] = []
    
    //MARK: Private Methods
    func loadSampleFrutinhas(){
        let fotoLimao = UIImage(named: "limao-1") ??  UIImage()
        let fotoMorango = UIImage(named: "morando-1") ?? UIImage()
        let fotoMaracuja = UIImage(named: "maracujasemente-1") ?? UIImage()
        
        let limao = Frutinha(fotoFrutinha: fotoLimao, nomeDaFrutinha: "Limão", familiaDaFrutinha: "", generoDaFrutinha: "", ordemDaFrutinha: "", carboidratosDaFrutinha: 0, proteinasDaFrutinha: 0, gordurasDaFrutinha: 0, caloriasDaFrutinha: 0, acucaresDaFrutinha: 0)
        
        let morango = Frutinha(fotoFrutinha: fotoMorango, nomeDaFrutinha: "Morango", familiaDaFrutinha: "", generoDaFrutinha: "", ordemDaFrutinha: "", carboidratosDaFrutinha: 0, proteinasDaFrutinha: 0, gordurasDaFrutinha: 0, caloriasDaFrutinha: 0, acucaresDaFrutinha: 0)
        
        let maracuja = Frutinha(fotoFrutinha: fotoMaracuja, nomeDaFrutinha: "Maracujá", familiaDaFrutinha: "", generoDaFrutinha: "", ordemDaFrutinha: "", carboidratosDaFrutinha: 0, proteinasDaFrutinha: 0, gordurasDaFrutinha: 0, caloriasDaFrutinha: 0, acucaresDaFrutinha: 0)
        
        frutinhas += [maracuja, morango, limao]
    }
    
    func load() {
        // TODO: Carregar dados do webservice
        let url = URL(string: "https://www.fruityvice.com/api/fruit/all")!
        let task = URLSession.shared.dataTask(with: url){data, response, error in
            do{
                let fruity = try JSONDecoder().decode([Fruity].self, from: data!)
                self.fruity = fruity
                self.frutinhas[2].familiaDaFrutinha = fruity[4].family
                self.frutinhas[2].generoDaFrutinha = fruity[4].genus
                self.frutinhas[2].ordemDaFrutinha = fruity[4].order
                self.frutinhas[2].carboidratosDaFrutinha = fruity[4].nutritions.carbohydrates
                self.frutinhas[2].proteinasDaFrutinha = fruity[4].nutritions.protein
                self.frutinhas[2].gordurasDaFrutinha = fruity[4].nutritions.fat
                self.frutinhas[2].caloriasDaFrutinha = fruity[4].nutritions.calories
                self.frutinhas[2].acucaresDaFrutinha = fruity[4].nutritions.sugar
                
                self.frutinhas[1].familiaDaFrutinha = fruity[10].family
                self.frutinhas[1].generoDaFrutinha = fruity[10].genus
                self.frutinhas[1].ordemDaFrutinha = fruity[10].order
                self.frutinhas[1].carboidratosDaFrutinha = fruity[10].nutritions.carbohydrates
                self.frutinhas[1].proteinasDaFrutinha = fruity[10].nutritions.protein
                self.frutinhas[1].gordurasDaFrutinha = fruity[10].nutritions.fat
                self.frutinhas[1].caloriasDaFrutinha = fruity[10].nutritions.calories
                self.frutinhas[1].acucaresDaFrutinha = fruity[10].nutritions.sugar
                
                self.frutinhas[0].familiaDaFrutinha = "Passifloraceae"
                self.frutinhas[0].generoDaFrutinha = "Passiflora"
                self.frutinhas[0].ordemDaFrutinha = "Malpighiales"
                self.frutinhas[0].carboidratosDaFrutinha = 23
                self.frutinhas[0].proteinasDaFrutinha = 2.2
                self.frutinhas[0].gordurasDaFrutinha = 0.7
                self.frutinhas[0].caloriasDaFrutinha = 97
                self.frutinhas[0].acucaresDaFrutinha = 11
                
                DispatchQueue.main.async {
                    self.animacaoInicial()
                }
                
            }catch{
                print("deu não")
            }
            
        }.resume()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MaracujaViewController {
            vc.frutinhas = frutinhas
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        if clearBack == false {
        self.view.backgroundColor = .black
        } else {
            self.view.backgroundColor = .clear
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    var clearBack = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleFrutinhas()
        self.load()
        viewNome.backgroundColor = .clear
        buttonInicial.isHidden = true
        view.backgroundColor = .black
        clearBack = true
        
        
    } // fecha view DidLoad
    
    
} // fecha view controller


