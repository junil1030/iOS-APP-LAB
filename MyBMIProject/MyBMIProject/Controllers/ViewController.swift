//
//  ViewController.swift
//  MyBMIProject
//
//  Created by 서준일 on 2/26/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmiManager = BMICalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            guard let secondVC = segue.destination as? SecondViewController else { return }
            
            // 계산된 결과 값 전달
            secondVC.bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text! )
        }
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "", weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 안써놨는뎅?.."
            mainLabel.textColor = .red
            return false
        } else if heightTextField.text == "" {
            mainLabel.text = "키 안써놨는뎅?.."
            mainLabel.textColor = .red
            return false
        } else if weightTextField.text == "" {
            mainLabel.text = "몸무게 안써놨는뎅?.."
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        mainLabel.textColor = .black
        return true
    }
    
    
}

extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}
