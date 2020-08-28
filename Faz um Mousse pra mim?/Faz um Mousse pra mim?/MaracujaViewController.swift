//
//  MaracujaViewController.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 28/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

 class MaracujaViewController: UIViewController {

    @IBOutlet weak var semente: UIImageView!
    @IBOutlet weak var imageMaracuja: UIImageView!
    
    
    @IBOutlet weak var buttonProximo: UIButton!
    
    
    var maracuja = UIImage.init (named: "maracuja")
    
    @IBAction func gestureMaracuja(_ sender: Any) {
        view.backgroundColor = .blue
        
        buttonProximo.isHidden = false
        
        imageMaracuja.image = maracuja
        
        semente.isHidden = false
        
        
    } // fecha tapGesture
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonProximo.isHidden = true
        semente.isHidden = true
        
    } // fecha viewDidLoad


} // fecha view controller
