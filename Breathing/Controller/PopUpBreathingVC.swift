//
//  PopUpBreathingVC.swift
//  Breathing
//
//  Created by Jackie Leonardy on 03/05/21.
//

import UIKit

class PopUpBreathingVC: UIViewController{
    
    @IBOutlet weak var uiLayerView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    var childView : UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiLayerView.backgroundColor = UIColor.babyBlueEyes
        uiLayerView.layer.cornerRadius = 20
        uiLayerView.layer.cornerRadius = 20
        setText()
        animateIn(uiView: uiLayerView)
    }
    
    func addUIView(){
        self.view.addSubview(childView)
        childView.center = self.view.center
        childView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        childView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        childView.backgroundColor = .black
    }
    
    func setText(){
        textLabel.attributedText = NSMutableAttributedString()
            .normal("For this breathing Method we'll be using")
            .bold(" the 4-7-8 method\n\n")
            .normal("We ")
            .bold("inhale")
            .normal(" for ")
            .bold("4 seconds, hold ")
            .normal(" for ")
            .bold("7 seconds, and release for 8 seconds.")
    }
    
    func animateIn(uiView : UIView){
//        uiView.frame = CGRect(x: 0, y: 0, width: uiView.frame.origin.x, height: uiView.frame.origin.y)
        uiView.alpha = 0
        
        UIView.animate(withDuration: 1) {
            uiView.alpha = 1
//            uiView.frame = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: uiView.frame.origin.x, height: uiView.frame.origin.y)
        }
    }
    
    @IBAction func dismissTapped(_ sender: Any) {
//        UIView.animate(withDuration: 4, comple) {
//            self.uiLayerView.alpha = 0
//        }
        
        UIView.animate(withDuration: 2) {
            self.uiLayerView.alpha = 0
        } completion: { (Data) in
//            self.removeFromParent()
            self.uiLayerView.removeFromSuperview()
        }

    }
}
