//
//  BMICalculatorManager.swift
//  MyBMIProject
//
//  Created by 서준일 on 2/26/25.
//
import UIKit

struct BMICalculatorManager {
    
    var myBmi: Double?
    
    func getBMIResult() -> Double {
        return myBmi ?? 0.0
    }
    
    mutating func calculateBMI(height: String, weight: String) {
        guard let heightDouble = Double(height), let weightDouble = Double(weight) else {
            myBmi = 0.0
            return
        }
        let bmi = weightDouble / (heightDouble * heightDouble) * 10_000
        self.myBmi = round(bmi * 10) / 10
    }
    
    func getBackgroundColor() -> UIColor {
        guard let bmi = myBmi else { return UIColor.black }
        switch bmi {
        case ..<18.6:
            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            return UIColor(displayP3Red: 218.255, green: 127/255, blue: 163/255, alpha: 1)
        case 25.0..<30.0:
            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30.0...:
            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            return .black
        }
    }
    
    func getBMIAdviceString() -> String {
        guard let bmi = myBmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
    }
    
}
