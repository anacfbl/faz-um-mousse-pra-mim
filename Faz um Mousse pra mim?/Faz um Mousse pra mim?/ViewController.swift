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
        
        UIView.animate (withDuration: 2.0, delay: 0, animations: {
                   
                   self.viewNome.center = self.view.center })
           
               
               UIView.animate (withDuration: 2, delay: 0,  animations: {
                   
                   self.view.backgroundColor = .black
                   self.view.backgroundColor = .white })
        
          buttonInicial.isHidden = false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
          viewNome.backgroundColor = .clear
        buttonInicial.isHidden = true
        view.backgroundColor = .black

        
    } // fecha view DidLoad


} // fecha view controller



//options:[UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse],
