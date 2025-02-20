//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 서준일 on 2/19/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }

    func setup() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = .emailAddress
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        
        textField.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // 텍스트 필드의 입력을 시작할 때 호출되는 메서드 (시작할지 말지의 여부 / 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 참과 거짓이 리턴값이 아닌 경우 보통 시점을 이야기 한다.
    // 사용자가 입력을 시작할 때 호출되는 메서드
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("입력 시작")
    }
    
    // 입력된 글자를 삭제할지 말지의 여부 (백스페이스는 가능하나 클리어 버튼이 눌리지 않음)
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return false
    }
    
    // 텍스트 필드 글자 내용이 (한글자 한글자) 입력이 되거나 지워질 때 호출이 되는 메서드 (허락의 개념)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil { // 숫자로 변환이 된다면 nil이 나올 수 없음
            return false        // 숫자 작성이 불가능하도록 막는 것
        } else {
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            return newLength <= 10 
        }
    }
    
    // 텍스트 필드의 엔터키가 눌러지면 다음 동작을 허락할 것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트 필드의 입력이 끝날 때 호출 (끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("입력 끝남")
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    
    
}

