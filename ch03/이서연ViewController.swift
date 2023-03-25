//
//  이서연ViewController.swift
//  ch03
//
//  Created by 이서연 on 2023/03/25.
//

import UIKit

class _______ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func fahrenheitEditingChange(_ sender: UITextField) {
        
    }
    
    @IBOutlet weak var celsiusLabel: UILabel!

}

class ConversionViewController: UIViewController {
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahrenheitTextField: UITextField!
}

extension ConversionViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        fahrenheitTextField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
}

extension ConversionViewController{
    @IBAction func fahrenheitEditingChanged(_ sender: UITextField) {
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

extension ConversionViewController{
    @objc func dismissKeyboard(sender: UITapGestureRecognizer){
        fahrenheitTextField.resignFirstResponder()
    }
}

extension ConversionViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        }else{
            return true
        }
    }
}

