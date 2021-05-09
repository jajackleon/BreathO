//
//  UserDataViewController.swift
//  Breathing
//
//  Created by Jackie Leonardy on 29/04/21.
//

import UIKit

class UserDataViewController: UIViewController {

    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    
    let userDefault = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goButton.layer.cornerRadius = 13
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        firstNameTextField.delegate = self
        secondNameTextField.delegate = self
        
        customiseTextField()
    }
    
    func customiseTextField(){
        firstNameTextField.layer.borderColor = UIColor.babyBlueEyes.cgColor
        firstNameTextField.layer.borderWidth = 2
        
        secondNameTextField.layer.borderColor = UIColor.babyBlueEyes.cgColor
        secondNameTextField.layer.borderWidth = 2
        
        firstNameTextField.layer.cornerRadius = 13
        secondNameTextField.layer.cornerRadius = 13
        
        firstNameTextField.textColor = UIColor.littleBoyBlue
        secondNameTextField.textColor = UIColor.littleBoyBlue
        
        
        firstNameTextField.setLeftPaddingPoints(15)
        secondNameTextField.setLeftPaddingPoints(15)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func textFieldChange(_ sender: Any) {
        if firstNameTextField.text?.isEmpty == false{
            goButton.isEnabled = true
            goButton.backgroundColor = UIColor.littleBoyBlue
        } else {
            goButton.isEnabled = false
            goButton.backgroundColor = UIColor.babyBlueEyes
        }
    }
    
    @IBAction func goTapped(_ sender: UIButton) {
        userDefault.setValue(firstNameTextField.text, forKey: "FirstName")
//        guard secondNameTextField.text != nil else {
//            return
//        }
//        userDefault.setValue(secondNameTextField!, forKey: "SecondName")
        
        performSegue(withIdentifier: "storyView", sender: nil)
    }
    

}

extension UserDataViewController : UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //triggered ketika fungsi textFieldShouldReturn memanggil endEditing
        if firstNameTextField.text != "" {
            firstNameTextField.resignFirstResponder()
            secondNameTextField.resignFirstResponder()
            return true
        } else {
            firstNameTextField.placeholder = "First name is a must"
            firstNameTextField.endEditing(true)
            firstNameTextField.resignFirstResponder()
            secondNameTextField.resignFirstResponder()
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstNameTextField.endEditing(true)
        secondNameTextField.endEditing(true)
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if firstNameTextField.text?.isEmpty == false{
            goButton.isEnabled = true
            goButton.backgroundColor = UIColor.littleBoyBlue
        } else {
            goButton.isEnabled = false
            goButton.backgroundColor = UIColor.babyBlueEyes
        }
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
