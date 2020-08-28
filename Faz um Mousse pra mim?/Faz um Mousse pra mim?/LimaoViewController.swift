//
//  LimaoViewController.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 28/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

class LimaoViewController: UIViewController {

    @IBOutlet weak var buttonLimao: UIButton!
    
    @IBAction func gestureLimao(_ sender: Any) {
        view.backgroundColor = .blue
        
        buttonLimao.isHidden = false
        
    } // fecha tapGesture
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonLimao.isHidden = true
        
    } // fecha viewDidload


} // fecha viewController
