//
//  LimaoViewController.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 28/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

class LimaoViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var imagemLimao: UIImageView!
    
    @IBOutlet weak var viewLimao: UIView!
    @IBOutlet weak var viewCores: UIView!
    @IBOutlet weak var viewTela: UIView!
    @IBOutlet weak var viewLabel: UIView!
    
    @IBOutlet weak var buttonProximo: UIButton!
    @IBOutlet weak var buttonLimao: UIButton!
    @IBOutlet weak var buttonMousseLimao: UIButton!
    
    
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
            self.label2.center = CGPoint(x: -10, y:200)
            self.label3.center = CGPoint(x: 400, y:50)
        })
        
        UIView.animate(withDuration: 1.5, delay: 0, options: [.allowUserInteraction, UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            
            self.label4.center = CGPoint(x: 300, y:20)
            self.label5.center = CGPoint(x: -80, y:1000)
        })
        
        UIView.animate(withDuration: 1, delay: 0, options: [.allowUserInteraction, UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            
            self.label6.center = CGPoint(x: -250, y:1000)
            self.label7.center = CGPoint(x: 10, y:100)
        })
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction, UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            
            self.label8.center = CGPoint(x: 400, y:800)
            self.label9.center = CGPoint(x: 350, y:700)
        })
        
    } // pisca label
    
    
    
    
    @IBAction func gestureLimao(_ sender: Any) {}
    
    var imageViewScale: CGFloat = 0.9
    let maxScale: CGFloat = 1.1
    let minScale: CGFloat = 0.03
    
    var frutinhas = [Frutinha]()
    
    @IBAction func scaleImage(_ sender:        UIPinchGestureRecognizer) {
        
        
        if imageViewScale <= 0.04 {
            //            buttonLimao.isEnabled = true
            buttonLimao.isHidden = false
            
        } else {
            buttonLimao.isHidden = true
        }
        
        if sender.state == .began || sender.state == .changed {
            
            let pinchScale: CGFloat = sender.scale
            
            if imageViewScale * pinchScale < maxScale && imageViewScale * pinchScale > minScale {
                imageViewScale *= pinchScale
                imagemLimao.transform = (imagemLimao.transform.scaledBy(x: pinchScale, y: pinchScale))
            }
            sender.scale = 1.0
        }
        
        print(imageViewScale)
    }
    
    
    
    @IBAction func tocouLimao(_ sender: Any) {
        print("tocou")
        viewLimao.isHidden = true
        buttonMousseLimao.isHidden = false
        viewLabel.isHidden = true
    }
    
    
    
    @IBAction func tocouMousse(_ sender: Any) {
        buttonProximo.isHidden = false }
    
    
    // tocou fora do limao:
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)
        
        let touch = touches.first
        guard let location = touch?.location(in: self.view) else { return }
        if !imagemLimao.frame.contains(location) {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: imagemLimao.center.x - 8, y: imagemLimao.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: imagemLimao.center.x + 8, y: imagemLimao.center.y))
            
            imagemLimao.layer.add(animation, forKey: "position")
        }
        
    } // fechou funcao tocou fora touchesbegan
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FrutinhaTableViewController {
            vc.frutinhas = frutinhas
        }
    }
    
    func trocaLabels() {
        label1.text = "Limão"
        label2.text = "\(frutinhas[2].familiaDaFrutinha)"
        label3.text = "\(frutinhas[2].generoDaFrutinha)"
        label4.text = "\(frutinhas[2].ordemDaFrutinha)"
        label5.text = "\(frutinhas[2].carboidratosDaFrutinha)g de carboidratos"
        label6.text = "\(frutinhas[2].proteinasDaFrutinha)g de proteínas"
        label7.text = "\(frutinhas[2].gordurasDaFrutinha)g de gorduras"
        label8.text = "\(frutinhas[2].caloriasDaFrutinha) de calorias"
        label9.text = "\(frutinhas[2].acucaresDaFrutinha)g de açúcar"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trocaLabels()
        piscaLabel()
        
        buttonProximo.isHidden = true
        viewLimao.backgroundColor = .clear
        viewLabel.backgroundColor = .clear
        buttonLimao.isHidden = true
        buttonMousseLimao.isHidden = true
        
        UIView.animate(withDuration: 1, delay: 0.0, options:[.allowUserInteraction, UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            self.viewCores.backgroundColor = .orange
            self.viewCores.backgroundColor = .systemPink
        }, completion: nil)
        
    } // didLoad
    
    
} // fecha viewController
