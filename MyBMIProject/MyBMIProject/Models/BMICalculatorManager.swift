//
//  BMICalculatorManager.swift
//  MyBMIProject
//
//  Created by 서준일 on 2/26/25.
//
import UIKit

struct BMICalculatorManager {
    
    private var myBmi: BMI?
    
    mutating func getBMI(height: String, weight: String) -> BMI {
        calculateBMI(height: height, weight: weight)
        
        return myBmi ?? BMI(value: 0.0, matchColor: .white, advice: "문제발생")
    }
    
    mutating private func calculateBMI(height: String, weight: String) {
        guard let heightDouble = Double(height), let weightDouble = Double(weight) else {
            myBmi = BMI(value: 0.0, matchColor: .white, advice: "문제발생")
            return
        }
        var bmi = weightDouble / (heightDouble * heightDouble) * 10_000
        bmi = round(bmi * 10) / 10
        
        switch bmi {
        case ..<18.6:
            let color = UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
            myBmi = BMI(value: bmi, matchColor: color, advice: "저체중")
        case 18.6..<23.0:
            let color = UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
            myBmi = BMI(value: bmi, matchColor: color, advice: "표준")
        case 23.0..<25.0:
            let color = UIColor(displayP3Red: 218.255, green: 127/255, blue: 163/255, alpha: 1)
            myBmi = BMI(value: bmi, matchColor: color, advice: "과체중")
        case 25.0..<30.0:
            let color = UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
            myBmi = BMI(value: bmi, matchColor: color, advice: "중도비만")
        case 30.0...:
            let color = UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
            myBmi = BMI(value: bmi, matchColor: color, advice: "고도비만")
        default:
            myBmi = BMI(value: 0.0, matchColor: .white, advice: "문제발생")
        }
    }
    
} 
