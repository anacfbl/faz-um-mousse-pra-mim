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
    @IBOutlet weak var viewCores: UIView!
    
    var contador = 0
    
    
    
    @IBAction func tocouMorango(_ sender: Any) {
        
        contador+=1
        
        print(contador)
        
        UIView.animate(withDuration: 0.6,animations: {
            self.viewMorango.transform =
                self.viewMorango.transform.scaledBy(x: 1.3, y: 1.3)}
            
        ) // fecha animacao increase
        
        
        if contador > 1 {
            buttonMousseMorango.isHidden = false
            buttonMorango.isHidden = true
        }
        
    } // fechou action tocou morango
    
    
    
    @IBAction func tocouMousse(_ sender: Any) {
        buttonProximo.isHidden = false
        
    }
    
    
    @IBAction func gestureMogango(_ sender: Any) {
        
    }
    
    
    // tocou fora do morango:
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)
        
        let touch = touches.first
        guard let location = touch?.location(in: self.view) else { return }
        if !buttonMorango.frame.contains(location) {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: buttonMorango.center.x - 8, y: buttonMorango.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: buttonMorango.center.x + 8, y: buttonMorango.center.y))
            
            buttonMorango.layer.add(animation, forKey: "position")
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buttonProximo.isHidden = true
        viewMorango.backgroundColor = .clear
        buttonMousseMorango.isHidden = true
        
        
        UIView.animate(withDuration: 1, delay: 0.0, options:[.allowUserInteraction, UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            self.viewCores.backgroundColor = .yellow
            self.viewCores.backgroundColor = .cyan
        }, completion: nil)
        
        
        
        
        
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        
        self.viewMorango.addGestureRecognizer(dragGesture)
        
        
    } // fecha viewDidload
    
    var inicialPosition = CGPoint.zero
    
    @objc func dragged(_ recognizer:UIPanGestureRecognizer){
        
        switch recognizer.state {
            
        case .began:
            inicialPosition = recognizer.view!.center
            
            break
            
        case .changed:
            
            recognizer.view!.center = recognizer.location(in: self.view)
            
            break
            
        case.ended:
            recognizer.view!.center = inicialPosition
            
            break
            
        default:
            return
            
        } // termina switch
        
    } // fecha dragged
    
    
} // fecha viewController
