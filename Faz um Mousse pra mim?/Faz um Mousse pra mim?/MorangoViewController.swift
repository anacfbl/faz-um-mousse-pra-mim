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
    
    @IBOutlet weak var viewMorango: UIView!
    
    var contador = 1
    
    @IBAction func tocouMorango(_ sender: Any) {

        UIView.animate(withDuration: 0.6,
        animations: {
            self.viewMorango.transform = CGAffineTransform(scaleX: 1 + 0.1 * CGFloat(self.contador), y: 1 + 0.1 * CGFloat(self.contador))
        }
            )
        
        contador+=1
        
        
    } // fechou action tocou morango
    
    
   
    
    
    // tocou em qualquer lugar
    @IBAction func gestureMogango(_ sender: Any) {
        
        view.backgroundColor = .blue
        
        buttonProximo.isHidden = false
        
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
//            else { print("Tapped inside the view") }
        
    } // fechou funcao tocou fora touchesbegan
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonProximo.isHidden = true
        viewMorango.backgroundColor = .clear
        
    } // fehca viewDidLoad
    
    
} // fecha viewController
