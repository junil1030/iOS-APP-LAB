//
//  SecondViewController.swift
//  MyBMIProject
//
//  Created by 서준일 on 2/26/25.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
//    var bmiNumber: Double?
//    var adviceString: String?
//    var bmiColor: UIColor?
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
        guard let bmi = bmi else { return }
        
        bmiNumberLabel.text = "\(bmi.value)"
        bmiNumberLabel.backgroundColor = bmi.matchColor
        adviceLabel.text = bmi.advice
    }

    func makeUI() {
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        
        backButton.setTitle("다시 계산하기", for: .normal)
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
