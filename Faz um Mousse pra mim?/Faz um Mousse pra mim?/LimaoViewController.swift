//
//  LimaoViewController.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 28/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

class LimaoViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var viewTela: UIView!
    @IBOutlet weak var imagemLimao: UIImageView!
    @IBOutlet weak var viewLimao: UIView!
    @IBOutlet weak var viewCores: UIView!
    @IBOutlet weak var buttonProximo: UIButton!
    @IBOutlet weak var buttonLimao: UIButton!
    @IBOutlet weak var buttonMousseLimao: UIButton!
    
    
    @IBAction func gestureLimao(_ sender: Any) {}
    
    var imageViewScale: CGFloat = 0.9
    let maxScale: CGFloat = 1.1
    let minScale: CGFloat = 0.03
    
    @IBAction func scaleImage(_ sender:        UIPinchGestureRecognizer) {
        
        //        imagemLimao.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        
        
                if sender.scale != 1 {
                    buttonLimao.isEnabled = true }
        
        if sender.state == .began || sender.state == .changed {
            
            let pinchScale: CGFloat = sender.scale
            
            if imageViewScale * pinchScale < maxScale && imageViewScale * pinchScale > minScale {
                imageViewScale *= pinchScale
                imagemLimao.transform = (imagemLimao.transform.scaledBy(x: pinchScale, y: pinchScale))
            }
            sender.scale = 1.0 }
        
        print(sender.scale)
    }
    
    
    
    @IBAction func tocouLimao(_ sender: Any) {
        print("tocou")
        viewLimao.isHidden = true
        buttonMousseLimao.isHidden = false }
    
    
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonProximo.isHidden = true
        viewLimao.backgroundColor = .clear
        buttonLimao.isHidden = false
        buttonLimao.isEnabled = false
        buttonMousseLimao.isHidden = true
        
        UIView.animate(withDuration: 1, delay: 0.0, options:[UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            self.viewCores.backgroundColor = .orange
            self.viewCores.backgroundColor = .systemPink
        }, completion: nil)
        
        
        
    } // fecha viewDidload
    
    
    
    
} // fecha viewController
