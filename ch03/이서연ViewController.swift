//
//  이서연ViewController.swift
//  ch03
//
//  Created by 이서연 on 2023/03/25.
//

import UIKit

class 이서연ViewController: UIViewController {
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahrenheitTextField: UITextField!
    
    let myDelegate=MyDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        fahrenheitTextField.delegate = myDelegate
    }
    
    @objc func dismissKeyboard(sender: UITapGestureRecognizer){
        fahrenheitTextField.resignFirstResponder()
    }
    @IBAction func fahrenheitEditingChange(_ sender: UITextField) {
        if let text = sender.text {
            if let fahrenheitValue = Double(text){
                let celsiusValue = 5.0/9.0*(fahrenheitValue - 32.0)
                celsiusLabel.text = String.init(format: "%.2f", celsiusValue)
            }else{
                celsiusLabel.text = "???"
            }
        }
    }
}

class MyDelegate: NSObject, UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existing = textField.text?.firstIndex(of: ".")
        let comming = string.firstIndex(of: ".")
        
        if let _ = existing, let _ = comming{
            return false
        }
        return true
    }
}

