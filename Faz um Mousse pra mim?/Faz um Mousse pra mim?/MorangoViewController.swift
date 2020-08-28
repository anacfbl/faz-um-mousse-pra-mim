//
//  MorangoViewController.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 28/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

class MorangoViewController: UIViewController {

    @IBOutlet weak var buttonMorango: UIButton!
    
    @IBAction func gestureMogango(_ sender: Any) {
        view.backgroundColor = .blue
        
        buttonMorango.isHidden = false
        
    } // fecha tapGesture
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonMorango.isHidden = true
        
    } // fehca viewDidLoad


} // fecha viewController
