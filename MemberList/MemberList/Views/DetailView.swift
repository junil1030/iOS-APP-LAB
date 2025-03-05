//
//  DetailView.swift
//  MemberList
//
//  Created by 서준일 on 3/5/25.
//

import UIKit

class DetailView: UIView {
    
    var member: Member? {
        didSet {
            guard var member = member else {
                saveButton.setTitle("SAVE", for: .normal)
                memberIdTextField.text = "\(Member.memberNumbers)"
                return
            }
            mainImageView.image = member.memberImage
            memberIdTextField.text = "\(member.memberId)"
            nameTextField.text = member.name
            phoneTextField.text = member.phone
            addressTextField.text = member.address
            guard let age = member.age else {
                ageTextField.text = ""
                return
            }
            ageTextField.text = "\(age)"
        }
    }
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 75
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var imageContainView: UIView = {
        let view = UIView()
        view.addSubview(mainImageView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let memberIdLable: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "멤버번호: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let memberIdTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size.height = 22
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.clearsOnBeginEditing = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var memberIdStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [memberIdLable, memberIdTextField])
        stView.spacing = 5
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        stView.translatesAutoresizingMaskIntoConstraints = false
        return stView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "이       름:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size.height = 22
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.clearsOnBeginEditing = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var nameStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        stView.spacing = 5
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        stView.translatesAutoresizingMaskIntoConstraints = false
        return stView
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "나       이:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ageTextField: UITextField = {
       let textField = UITextField()
        textField.frame.size.height = 22
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.clearsOnBeginEditing = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var ageStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [ageLabel, ageTextField])
        stView.spacing = 5
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        stView.translatesAutoresizingMaskIntoConstraints = false
        return stView
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "전 화 번 호:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneTextField: UITextField = {
       let textField = UITextField()
        textField.frame.size.height = 22
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.clearsOnBeginEditing = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var phoneStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [phoneLabel, phoneTextField])
        stView.spacing = 5
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        stView.translatesAutoresizingMaskIntoConstraints = false
        return stView
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "주      소:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressTextField: UITextField = {
       let textField = UITextField()
        textField.frame.size.height = 22
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.clearsOnBeginEditing = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var addressStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [addressLabel, addressTextField])
        stView.spacing = 5
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        stView.translatesAutoresizingMaskIntoConstraints = false
        return stView
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("UPDATE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.frame.size.height = 40
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageContainView, memberIdStackView, nameStackView, ageStackView, phoneStackView, addressStackView, saveButton])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 레이블 넓이 저장을 위한 속성
    let labelWidth: CGFloat = 70
    // 애니메이션을 위한 속성
    var stackViewTopConstrint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
        setupNotification()
        setupMemberIdTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        self.addSubview(stackView)
    }
    
    func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(moveUpAction), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveDownAction), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupMemberIdTextField() {
        memberIdTextField.delegate = self
    }
    
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 150),
            mainImageView.widthAnchor.constraint(equalToConstant: 150),
            mainImageView.centerXAnchor.constraint(equalTo: imageContainView.centerXAnchor),
            mainImageView.centerYAnchor.constraint(equalTo: imageContainView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageContainView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            memberIdLable.widthAnchor.constraint(equalToConstant: labelWidth),
            nameLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            ageLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            phoneLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            addressLabel.widthAnchor.constraint(equalToConstant: labelWidth),
        ])
        
        stackViewTopConstrint = stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)
        
        NSLayoutConstraint.activate([
            stackViewTopConstrint,
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func moveUpAction() {
        stackViewTopConstrint.constant = -20
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func moveDownAction() {
        stackViewTopConstrint.constant = 10
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension DetailView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == memberIdTextField {
            return false
        }
        
        return true
    }
}
