//
//  MaracujaViewController.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 28/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

class MaracujaViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    
    @IBOutlet weak var semente: UIImageView!
    @IBOutlet weak var viewCores: UIView!
    
    @IBOutlet weak var imageMaracuja: UIImageView!
    @IBOutlet weak var viewMaracuja: UIView!
    
    @IBOutlet weak var buttonProximo: UIButton!
    
    var maracuja = UIImage.init (named: "maracuja-1")
    
    @IBAction func gestureMaracuja(_ sender: Any) {
        buttonProximo.isHidden = false
        imageMaracuja.image = maracuja
        semente.isHidden = false
        
    } // fecha tapGesture
    
    
    
//     tocou fora do maracuja:
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
            super.touchesBegan(touches, with: event)
    
            let touch = touches.first
            
            guard let location = touch?.location(in: self.view) else { return }
            if !viewMaracuja.frame.contains(location) {
               
                let animation = CABasicAnimation(keyPath: "position")
                animation.duration = 0.07
                animation.repeatCount = 4
                animation.autoreverses = true
                animation.fromValue = NSValue(cgPoint: CGPoint(x: viewMaracuja.center.x - 8, y: viewMaracuja.center.y))
                animation.toValue = NSValue(cgPoint: CGPoint(x: viewMaracuja.center.x + 8, y: viewMaracuja.center.y))
    
                viewMaracuja.layer.add(animation, forKey: "position")
            }
        }
    
    
    
    // DRAG AND DROP

    
        var initialCenter = CGPoint()
    
        @IBAction func dragDrop(_ sender: UIPanGestureRecognizer) {
    
    
            guard sender.view != nil else {return}
    
            let gesture = sender.view!
            let translation = sender.translation(in: gesture.superview)
    
    
            if sender.state == .began {
                self.initialCenter = gesture.center }
    
    
            if sender.state == .cancelled {
                let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
                gesture.center = newCenter }
    
    
            else {
                gesture.center = initialCenter }
    
    
        } //
    
    
//    var initialCenter = CGPoint()
//    var movedImage = UIImageView ()
//    var dropArea = UIView ()
//
//    @IBAction func dragDrop(_ sender: Any) {
//
//        func drag (sender: UIPanGestureRecognizer) {
//
//            //               self.view.bringSubviewToFront(semente)
//
//            let translation = sender.translation(in: self.view)
//
//            //               if let view = sender.view {
//            //                   view.center = CGPoint(x:view.center.x + translation.x,
//            //                                         y:view.center.y + translation.y)
//
//            //                   if sender.state == UIGestureRecognizer.State.ended {
//
//            let here = sender.location(in: self.view)
//            let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
//
//            if (viewMaracuja.frame.contains(here)) {
//                semente.center = newCenter }
//
//            else {
//                semente.center = initialCenter
//                //                       }
//
//            }
//
//            sender.setTranslation(CGPoint.zero, in: self.view)
//        }
//
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonProximo.isHidden = true
        
        semente.isHidden = true
        
        viewMaracuja.backgroundColor = .clear
        
        UIView.animate(withDuration: 1, delay: 0.0, options:[UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            self.viewCores.backgroundColor = .red
            self.viewCores.backgroundColor = .purple
        }, completion: nil)
        
        
        
        
    } // fecha viewDidLoad
    
    
} // fecha view controller






