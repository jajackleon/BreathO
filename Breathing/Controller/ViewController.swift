//
//  ViewController.swift
//  Breathing
//
//  Created by Jackie Leonardy on 29/04/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var tappingLabel: UILabel!
    @IBOutlet weak var meditatingButton: UIButton!
    
    var pulsatingLayer1: CAShapeLayer!
    var pulsatingLayer2: CAShapeLayer!
    var pulsatingLayer3: CAShapeLayer!
    
    var userDefault = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPulse()
        tappingLabelAnimation()
        view.bringSubviewToFront(meditatingButton)
        animatePulse(shapeLayer: pulsatingLayer1, scale: 1.2, duration: 2)
        animatePulse(shapeLayer: pulsatingLayer2, scale: 1.4, duration: 2)
        animatePulse(shapeLayer: pulsatingLayer3, scale: 1.6, duration: 2)
        MusicPlayer.playSound(sound: "Music1")
    }
    
    @IBAction func meditatingTapped(_ sender: Any) {
//        performSegue(withIdentifier: "breathing", sender: nil)
//        MusicPlayer.fadeSound(ratioVolume: 0.2, transitionTime: 3.0)
    }
    
    @IBAction func screenTap(_ sender: Any) {
        showAlert()
//        self.tappingLabel.layer.removeAllAnimations()
//        self.tappingLabel.alpha = 1
//        self.meditatingButton.layer.removeAllAnimations()
    }
    
    func tappingLabelAnimation(){
//        UIView.animate(withDuration: 1.5) {
//            self.tappingLabel.alpha = 0
//        } completion: { (Bool) in
//            UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseInOut) {
//                self.tappingLabel.alpha = 1
//            } completion: { _ in
//                self.tappingLabelAnimation()
//            }
//        }
        
        UIView.animate(withDuration: 2, delay: 0, options: [ .curveEaseInOut, .autoreverse, .repeat ]) {
                self.tappingLabel.alpha = 0
            } completion: { _ in }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Let's Breathe!", message: "Do you want to Start your Journey?", preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "Yes", style: .default){
            (action) in
            
            if (self.userDefault.value(forKey: "FirstName") as? String) != nil{
                self.performSegue(withIdentifier: "storyView", sender: nil)
            }
            else {
                self.performSegue(withIdentifier: "userInput", sender: nil)
            }
        }
        alert.addAction(cancelButton)
        
        let startButton = UIAlertAction(title: "No", style: .cancel){
            (action) in
            self.performSegue(withIdentifier: "breathing", sender: nil)
        }
        
        alert.addAction(startButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func loadPulse(){
        
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 99, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        pulsatingLayer1 = CAShapeLayer()
        pulsatingLayer2 = CAShapeLayer()
        pulsatingLayer3 = CAShapeLayer()
        
        
        createPulse(shapeLayer: pulsatingLayer1 ,maskPath: circularPath, opacity: 0.3)
        createPulse(shapeLayer: pulsatingLayer2 ,maskPath: circularPath, opacity: 0.2)
        createPulse(shapeLayer: pulsatingLayer3 ,maskPath: circularPath, opacity: 0.1)
        
        var data2 = CAShapeLayer()
        data2 = CAShapeLayer()
        data2.path = circularPath.cgPath
        data2.strokeColor = UIColor.clear.cgColor
        data2.lineWidth = 0
        data2.position = view.center
        data2.zPosition = 0
        data2.opacity = 1

        view.layer.addSublayer(data2)
    }
    
    func createPulse(shapeLayer: CAShapeLayer, maskPath : UIBezierPath, opacity: Float){
        shapeLayer.path = maskPath.cgPath
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.frenchSkyBlue.cgColor
        shapeLayer.position = view.center
        shapeLayer.opacity = opacity
        
        view.layer.addSublayer(shapeLayer)
    }
    
    func animatePulse(shapeLayer: CAShapeLayer, scale: Float, duration: Float){
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.9
        animation.toValue = scale
        animation.duration = CFTimeInterval(duration)

        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        shapeLayer.add(animation, forKey: "pulsing")
    }
    
    
}
