//
//  MaracujaViewController.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 28/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

class MaracujaViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var frutinhas = [Frutinha]()
    var contador = 0
    var sementes: [UIImageView] = []
    
    @IBOutlet weak var viewLabel: UIView!
    @IBOutlet weak var semente: UIImageView!
    @IBOutlet weak var semente2: UIImageView!
    @IBOutlet weak var semente3: UIImageView!
    @IBOutlet weak var semente4: UIImageView!
    @IBOutlet weak var semente5: UIImageView!
    @IBOutlet weak var semente6: UIImageView!
    @IBOutlet weak var semente7: UIImageView!
    @IBOutlet weak var semente8: UIImageView!
    @IBOutlet weak var semente9: UIImageView!
    @IBOutlet weak var semente10: UIImageView!
    
    
    
    @IBOutlet weak var viewCores: UIView!
    
    @IBOutlet weak var imageMaracuja: UIImageView!
    @IBOutlet weak var viewMaracuja: UIView!
    
    @IBOutlet weak var buttonProximo: UIButton!
    @IBOutlet weak var buttonMousse: UIButton!
    

    
    var maracuja = UIImage.init (named: "maracuja-1")
    
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
            
            self.label1.center = CGPoint(x: 200, y:800)
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
    
    @IBAction func tocouMousse(_ sender: Any) {
        buttonProximo.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MorangoViewController {
            vc.frutinhas = frutinhas
        }
    }
    
    func trocaLabels() {
        label1.text = "Maracujá"
        label2.text = "\(frutinhas[0].familiaDaFrutinha)"
        label3.text = "\(frutinhas[0].generoDaFrutinha)"
        label4.text = "\(frutinhas[0].ordemDaFrutinha)"
        label5.text = "\(frutinhas[0].carboidratosDaFrutinha)g de carboidratos"
        label6.text = "\(frutinhas[0].proteinasDaFrutinha)g de proteínas"
        label7.text = "\(frutinhas[0].gordurasDaFrutinha)g de gorduras"
        label8.text = "\(frutinhas[0].caloriasDaFrutinha) de calorias"
        label9.text = "\(frutinhas[0].acucaresDaFrutinha)g de açúcar"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trocaLabels()
        self.sementes = [semente, semente2, semente3, semente4, semente5, semente6, semente7, semente8, semente9, semente10]
        print(frutinhas)
        piscaLabel()
        viewLabel.backgroundColor = .clear
        
        buttonProximo.isHidden = true
        buttonMousse.isHidden = true
        
        semente.isHidden = true
        semente2.isHidden = true
        semente3.isHidden = true
        semente4.isHidden = true
        semente5.isHidden = true
        semente6.isHidden = true
        semente7.isHidden = true
        semente8.isHidden = true
        semente9.isHidden = true
        semente10.isHidden = true
        
        viewMaracuja.backgroundColor = .clear
        
        
        UIView.animate(withDuration: 1, delay: 0.0, options:[.allowUserInteraction, UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
            self.viewCores.backgroundColor = .red
            self.viewCores.backgroundColor = .purple
        }, completion: nil)
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        

        
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        
        let dragGesture2 = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        
        let dragGesture3 = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        
        let dragGesture4 = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        
        let dragGesture5 = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        
        let dragGesture6 = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        
        let dragGesture7 = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        
        let dragGesture8 = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        
        let dragGesture9 = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        
        let dragGesture10 = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        
        self.semente.addGestureRecognizer(dragGesture)
        self.semente2.addGestureRecognizer(dragGesture2)
        self.semente3.addGestureRecognizer(dragGesture3)
        self.semente4.addGestureRecognizer(dragGesture4)
        self.semente5.addGestureRecognizer(dragGesture5)
        self.semente6.addGestureRecognizer(dragGesture6)
        self.semente7.addGestureRecognizer(dragGesture7)
        self.semente8.addGestureRecognizer(dragGesture8)
        self.semente9.addGestureRecognizer(dragGesture9)
        self.semente10.addGestureRecognizer(dragGesture10)
        
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
//                let frame = self.view.convert(recognizer.view!.frame, from: viewMaracuja)
                print(recognizer.view?.frame)
                
                recognizer.view?.frame.origin.x = (recognizer.view?.frame.midX)! - 140
                recognizer.view?.frame.origin.y = (recognizer.view?.frame.midY)! - 390
                viewMaracuja.addSubview(recognizer.view!)
                print(recognizer.view?.frame)
                
                if self.sementes.count == 1 {
                    buttonMousse.isHidden = false
                    viewMaracuja.isHidden = true
            
                    semente.isHidden = true
                    semente2.isHidden = true
                    semente3.isHidden = true
                    semente4.isHidden = true
                    semente5.isHidden = true
                    semente6.isHidden = true
                    semente7.isHidden = true
                    semente8.isHidden = true
                    semente9.isHidden = true
                    semente10.isHidden = true
                    
                    viewLabel.isHidden = true
                    
                } else {
                    self.sementes = self.sementes.filter {
                        $0 != recognizer.view
                    }
                    recognizer.view?.isUserInteractionEnabled = false
                    
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
            semente3.isHidden = false
            semente4.isHidden = false
            semente5.isHidden = false
            semente6.isHidden = false
            semente7.isHidden = false
            semente8.isHidden = false
            semente9.isHidden = false
            semente10.isHidden = false
            
            
            
            
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




