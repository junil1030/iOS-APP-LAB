//
//  DetailViewController.swift
//  MemberList
//
//  Created by 서준일 on 3/5/25.
//

import UIKit
import PhotosUI

final class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    weak var delegate: MemberDelegate?
    
    var member: Member?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonAction()
        setupData()
        setupTapGestures()
    }
    
    private func setupData() {
        detailView.member = member
    }
    
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    // 이미지뷰가 눌리면 실행하는 제스쳐 설정
    func setupTapGestures() {
        let tapGesutre = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
        detailView.mainImageView.addGestureRecognizer(tapGesutre)
        detailView.mainImageView.isUserInteractionEnabled = true // 유저와의 동작이 가능하도록
    }
    
    @objc func touchUpImageView() {
        print("이미지뷰 터치")
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .any(of: [.images, .videos])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    @objc func saveButtonTapped() {
        
        if member == nil {
            let name = detailView.nameLabel.text ?? ""
            let age = Int(detailView.ageLabel.text ?? "") ?? 0
            let phoneNumber = detailView.phoneLabel.text ?? ""
            let address = detailView.addressLabel.text ?? ""
            
            var newMember = Member(name: name, age: age, phone: phoneNumber, address: address)
            newMember.memberImage = detailView.mainImageView.image
            
//            let index = navigationController!.viewControllers.count - 2
//            let vc = navigationController?.viewControllers[index] as! ViewController
//            vc.memberListManager.makeNewMember(newMember)
            
            delegate?.addNewMember(newMember)
            
        } else {
            
            member!.memberImage = detailView.mainImageView.image
            
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            detailView.member = member
            
//            let index = navigationController!.viewControllers.count - 2
//            let vc = navigationController?.viewControllers[index] as! ViewController
//            vc.memberListManager.updateMemberInfo(index: memberId, member!)
            
            delegate?.update(index: memberId, member!)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension DetailViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)

        let itemProvider = results.first?.itemProvider

        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.sync {
                    self.detailView.mainImageView.image = image as? UIImage
                }
            }
        } else {
            print("이미지 불러오기 실패")
        }
    }


}
