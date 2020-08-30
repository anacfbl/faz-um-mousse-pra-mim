//
//  LimaoViewController.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 28/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

class LimaoViewController: UIViewController {

    
    @IBOutlet weak var viewLimao: UIView!
    @IBOutlet weak var buttonProximo: UIButton!
    
    @IBAction func gestureLimao(_ sender: Any) {
        view.backgroundColor = .orange
        
        buttonProximo.isHidden = false
        
    } // fecha tapGesture
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)

        let touch = touches.first
        guard let location = touch?.location(in: self.view) else { return }
        if !viewLimao.frame.contains(location) {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: viewLimao.center.x - 8, y: viewLimao.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: viewLimao.center.x + 8, y: viewLimao.center.y))

            viewLimao.layer.add(animation, forKey: "position")
        }
        
    } // fechou funcao tocou fora touchesbegan
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonProximo.isHidden = true
        viewLimao.backgroundColor = .clear
        
        
    } // fecha viewDidload


} // fecha viewController
