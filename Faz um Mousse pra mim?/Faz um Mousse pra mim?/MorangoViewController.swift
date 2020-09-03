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
    @IBOutlet weak var viewLabel: UIView!
    @IBOutlet weak var viewCores: UIView!
    
    var contador = 0
    var frutinhas = [Frutinha]()
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    
    
    func piscaLabel() {
        
        UIView.animate(withDuration: 2, delay: 0, options: [.allowUserInteraction, UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            
            self.label1.center = CGPoint(x: 200, y:1500)
            self.label2.center = CGPoint(x: 200, y:200)
            self.label3.center = CGPoint(x: 400, y:50)
        })
        
        UIView.animate(withDuration: 1.5, delay: 0, options: [.allowUserInteraction, UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            
            self.label4.center = CGPoint(x: 300, y:20)
            self.label5.center = CGPoint(x: 80, y:1000)
        })
        
        UIView.animate(withDuration: 1, delay: 0, options: [.allowUserInteraction, UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            
            self.label6.center = CGPoint(x: 250, y:1000)
            self.label7.center = CGPoint(x: -10, y:100)
        })
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction, UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            
            self.label8.center = CGPoint(x: 300, y:200)
            self.label9.center = CGPoint(x: 350, y:460)
            self.label10.center = CGPoint(x: 400, y:100)
        })
        
    } // pisca label
    
    
    @IBAction func tocouMorango(_ sender: Any) {
        
        contador+=1
        
        print(contador)
        
        UIView.animate(withDuration: 0.6,animations: {
            self.viewMorango.transform =
                self.viewMorango.transform.scaledBy(x: 1.3, y: 1.3)}
            
        ) // fecha animacao increase
        
        
        if contador == 12 {
            buttonMousseMorango.isHidden = false
            viewMorango.isHidden = true
            viewLabel.isHidden = true
            
        }
        
    } // fechou action tocou morango
    
    
    
    @IBAction func tocouMousse(_ sender: Any) {
        buttonProximo.isHidden = false
    }
    
    
    @IBAction func gestureMogango(_ sender: Any) {}
    
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LimaoViewController {
            vc.frutinhas = frutinhas
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        piscaLabel()
        buttonProximo.isHidden = true
        viewMorango.backgroundColor = .clear
        buttonMousseMorango.isHidden = true
        viewLabel.backgroundColor = .clear
        
        
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
