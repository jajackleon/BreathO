//
//  GameViewController.swift
//  Breathing
//
//  Created by Jackie Leonardy on 28/04/21.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    var currScene : GameScene?
    var timer: Timer?
    var second : Int = 4
    var flag : Int = 0
    var counter: Int = 0
    var secCounter : Int = 0
    var firstSecond: Int = 0
    
    @IBOutlet weak var childViewContainer: UIView!
    @IBOutlet weak var timerCount: UIButton!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var breathingButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        buildPetalScene()
        dismissButton.layer.cornerRadius = 10
        buttonScene()
        timerCount.setTitle("0", for: .normal)
    }
    
    @IBAction func dismissTapped(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.childViewContainer.alpha = 0
            self.dismissButton.alpha = 0
        } completion: { (Data) in
            self.childViewContainer.removeFromSuperview()
            self.dismissButton.removeFromSuperview()
        }
    }
    
    func changeLabel(label: String){
        self.label.text = label
    }
    
    func buttonScene(){
        dismissButton.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.dismissButton.alpha = 1
        }
    }
    
    func addUIView(){
        let childView = UIView()
        self.view.addSubview(childView)
        
        childView.translatesAutoresizingMaskIntoConstraints = false
        
        childView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        childView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        childView.heightAnchor.constraint(equalToConstant: 295).isActive = true
        childView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        childView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 40).isActive = true
        
        UIView.animate(withDuration: 4) {
            childView.alpha = 0
            self.view.removeFromSuperview()
        } completion: { (Data) in
            
        }
        
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
            if action == #selector(UIResponderStandardEditActions.paste(_:)) {
                return false
            }
            return super.canPerformAction(action, withSender: sender)
        }
    
    @IBAction func breathingTapped(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)

            UIView.animate(withDuration: 2.0,
                                       delay: 0,
                                       usingSpringWithDamping: CGFloat(0.20),
                                       initialSpringVelocity: CGFloat(6.0),
                                       options: UIView.AnimationOptions.allowUserInteraction,
                                       animations: {
                                        sender.transform = CGAffineTransform.identity
                },
                                       completion: { Void in()  }
            )
        showAlert()
        
    }
    
    func counterBreathe(second : Int, counter: Int){
        timerCount.setTitle(String(second), for: .normal)
        self.second = second - 1
        self.firstSecond = second
        self.counter = counter
        UIView.animate(withDuration: 0.5) {
            self.timerCount.alpha = 1
        }
        changeLabel(label: "Breathe In...")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
        timerCount.layer.cornerRadius = timerCount.bounds.size
            .width / 2
        timerCount.isEnabled = false
    }
    
    @objc func onTimer(timer: Timer) {
        if second - 1 == -1 && flag == 0{
            changeLabel(label: "Hold...")
            flag += 1
            second = 7
            
        }
        else if second - 1 == -1 && flag == 1{
            changeLabel(label: "Release...")
            flag += 1
            second = 8
        }
        
        else if second - 1 == -1 && flag == 2 {
            self.secCounter += 1
            self.flag = 0
            timer.invalidate()
            if self.secCounter != self.counter {
                counterBreathe(second: firstSecond, counter: self.counter)
            } else{
                changeLabel(label: "Let's Breathe!")
                self.timerCount.setTitle("0", for: .normal)
                UIView.animate(withDuration: 0.5) {
                    self.timerCount.alpha = 0
                }
                return
            }
            return
        }
        
        else if second == 0 {
            UIView.performWithoutAnimation {
                self.timerCount.setTitle(String(second), for: .normal)
                self.timerCount.layoutIfNeeded()
            }
            print(second)
            return
        }
        UIView.performWithoutAnimation {
            self.timerCount.setTitle(String(second), for: .normal)
            self.timerCount.layoutIfNeeded()
        }
        second -= 1
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Let's Breathe!", message: "How many Repetitions do you want?", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "repetitions in number"
            textField.keyboardType = .numberPad
        }
        
        let cancelButton = UIAlertAction(title: "Breathe", style: .default){ [self]
            (action) in

            let textField = alert.textFields![0] // [0] karena textField bisa punya banyak colletions of textFields, jadi kalau ada 2 textfield bisa akses [1]
            
            guard textField.text! != "" else{
                return
            }
            
            let text = textField.text!
            let repetitions : Int = Int(text) ?? 0
            
            self.breathingButton.isUserInteractionEnabled = false
            self.currScene?.generatePetal(count: repetitions)
            
            self.counterBreathe(second: 4, counter: repetitions)
        }
        
        alert.addAction(cancelButton)
        
        let startButton = UIAlertAction(title: "Cancel", style: .cancel){
            (action) in
        }
        
        alert.addAction(startButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func buildPetalScene(){
        if let view = self.view as! SKView? {
            let scene = SKScene(fileNamed: "GameScene") //file sks
                
            scene?.scaleMode = .aspectFill
            view.presentScene(scene)
            
            currScene = scene as? GameScene
            currScene?.viewController = self
            
            view.ignoresSiblingOrder = true
//             ph  
            
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
}
