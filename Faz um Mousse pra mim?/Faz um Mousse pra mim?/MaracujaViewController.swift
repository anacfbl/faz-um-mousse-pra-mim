//
//  MaracujaViewController.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 28/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

class MaracujaViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    var contador = 0
    
    @IBOutlet weak var semente: UIImageView!
    @IBOutlet weak var semente2: UIImageView!
    @IBOutlet weak var viewCores: UIView!
    
    @IBOutlet weak var imageMaracuja: UIImageView!
    @IBOutlet weak var viewMaracuja: UIView!
    
    @IBOutlet weak var buttonProximo: UIButton!
    
    var maracuja = UIImage.init (named: "maracuja-1")
    
    //    @IBAction func gestureMaracuja(_ sender: Any) {
    //        buttonProximo.isHidden = false
    //        imageMaracuja.image = maracuja
    //        semente.isHidden = false
    //
    //    } // fecha tapGesture
    
    
    
    
    // DRAG AND DROP
    
    
    //    var initialCenter = CGPoint()
    
    
    //    @IBAction func dragDrop(_ sender: UIPanGestureRecognizer) {
    //
    //
    //        guard sender.view != nil else {return}
    //
    //        let gesture = sender.view!
    //        let translation = sender.translation(in: gesture.superview)
    //
    //
    //        if sender.state == .began {
    //            self.initialCenter = gesture.center }
    //
    //
    //        if sender.state == .cancelled {
    //            let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
    //            gesture.center = newCenter }
    //
    //
    //        else {
    //            gesture.center = initialCenter }
    //
    //        semente.isUserInteractionEnabled = true
    //
    //
    //    } //
    
    
    
    
    //        var initialCenter = CGPoint()
    //        var movedImage = UIImageView ()
    //        var dropArea = UIView ()
    //
    //        @IBAction func dragDrop(_ sender: Any) {
    //
    //            func drag (sender: UIPanGestureRecognizer) {
    //
    //                //               self.view.bringSubviewToFront(semente)
    //
    //                let translation = sender.translation(in: self.view)
    //
    //                //               if let view = sender.view {
    //                //                   view.center = CGPoint(x:view.center.x + translation.x,
    //                //                                         y:view.center.y + translation.y)
    //
    //                //                   if sender.state == UIGestureRecognizer.State.ended {
    //
    //                let here = sender.location(in: self.view)
    //                let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
    //
    //                if (viewMaracuja.frame.contains(here)) {
    //                    semente.center = newCenter }
    //
    //                else {
    //                    semente.center = initialCenter
    //                    //                       }
    //
    //                }
    //
    //                sender.setTranslation(CGPoint.zero, in: self.view)
    //            }
    //
    //        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonProximo.isHidden = true
        
        semente.isHidden = true
        semente2.isHidden = true
        
        viewMaracuja.backgroundColor = .clear
        
        UIView.animate(withDuration: 1, delay: 0.0, options:[.allowUserInteraction, UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            self.viewCores.backgroundColor = .red
            self.viewCores.backgroundColor = .purple
        }, completion: nil)
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        
        
        
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        
        let dragGesture2 = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        
        self.semente.addGestureRecognizer(dragGesture)
        self.semente2.addGestureRecognizer(dragGesture2)
        
    } // fecha viewDidLoad
    
    var inicialPosition = CGPoint.zero
    
    
    @objc func dragged(_ recognizer:UIPanGestureRecognizer){
        
        switch recognizer.state {
            
        case .began:
            inicialPosition = recognizer.view!.center
            
            break
            
        case .changed:

            recognizer.view!.center = recognizer.location(in: self.view)
            
            break
            
        case .ended:
            
            if viewMaracuja.frame.contains(recognizer.location(in: self.view)) {
                
                if contador == 1 {
                    buttonProximo.isHidden = false
                    
                } else {
                    contador += 1
                    
                }
                
            } else {
                recognizer.view!.center = inicialPosition
            }
            
            
            break
            
        default:
            return
            
        } // termina switch
        
    } // fecha dragged
    
    
    
    @objc func tapped(_ recognizer:UITapGestureRecognizer) {
        
        if viewMaracuja.frame.contains(recognizer.location(in: self.view)) {
            imageMaracuja.image = maracuja
            semente.isHidden = false
            semente2.isHidden = false
            
            
        } else {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: viewMaracuja.center.x - 8, y: viewMaracuja.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: viewMaracuja.center.x + 8, y: viewMaracuja.center.y))
            
            viewMaracuja.layer.add(animation, forKey: "position")
        }
        
    } // fecha tapped
    

    
} // fecha view controller





//     tocou fora do maracuja:

