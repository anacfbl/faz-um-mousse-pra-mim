//
//  MorangoViewController.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 28/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

class MorangoViewController: UIViewController {
    
    @IBOutlet weak var buttonProximo: UIButton!
    @IBOutlet weak var buttonMorango: UIButton!
    @IBOutlet weak var buttonMousseMorango: UIButton!
    
    @IBOutlet weak var viewMorango: UIView!
    
    var contador = 0
    
   
        
    @IBAction func tocouMorango(_ sender: Any) {

        contador+=1
        
        print(contador)
        
        UIView.animate(withDuration: 0.6,
        animations: {
            self.viewMorango.transform =
                self.viewMorango.transform.scaledBy(x: 1.3, y: 1.3)
        }
            ) // fecha animacao increase
        
        if contador > 0 {
            buttonMousseMorango.isHidden = false
            buttonMorango.isHidden = true
        }
        
    } // fechou action tocou morango
    
    
   
    @IBAction func tocouMousse(_ sender: Any) {
              buttonProximo.isHidden = false

    }
    
    
    // tocou em qualquer lugar
    @IBAction func gestureMogango(_ sender: Any) {
    } // fecha tapGesture
    
    
    // tocou fora do morango:
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)

        let touch = touches.first
        guard let location = touch?.location(in: self.view) else { return }
        if !viewMorango.frame.contains(location) {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: viewMorango.center.x - 8, y: viewMorango.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: viewMorango.center.x + 8, y: viewMorango.center.y))

            viewMorango.layer.add(animation, forKey: "position")
        }
        
    } // fechou funcao tocou fora touchesbegan
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .cyan
        buttonProximo.isHidden = true
        viewMorango.backgroundColor = .clear
        buttonMousseMorango.isHidden = true
        
    } // fehca viewDidLoad
    
    
} // fecha viewController
