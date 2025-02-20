//
//  ViewController.swift
//  myTimer
//
//  Created by 서준일 on 2/18/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
        number = 0
        timer = nil
    }

    
    @IBAction func sliderChanged(_ sender: UISlider) {
        //mainLabel.text = String(format: "%.f", sender.value)
        let seconds = Int(sender.value * 60)
        mainLabel.text = "\(seconds)초"
        number = seconds
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfterOneSecond), userInfo: nil, repeats: true)
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
//            if number > 0 {
//                number -= 1
//                slider.value = Float(number) / Float(60)
//                mainLabel.text = "\(number)초"
//                
//            } else {
//                number = 0
//                timer?.invalidate()
//                mainLabel.text = "초를 선택하세요"
//                AudioServicesPlaySystemSound(SystemSoundID(1007))
//            }
//        }
    }
    
    @objc func doSomethingAfterOneSecond() {
        if number > 0 {
            number -= 1
            slider.value = Float(number) / Float(60)
            mainLabel.text = "\(number)초"
            
        } else {
            number = 0
            timer?.invalidate()
            mainLabel.text = "초를 선택하세요"
            AudioServicesPlaySystemSound(SystemSoundID(1007))
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        configureUI()
    }
    
}

