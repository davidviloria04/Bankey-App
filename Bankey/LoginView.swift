//
//  LoginView.swift
//  Bankey
//
//  Created by David Viloria Ortega on 27/03/22.
//

import UIKit
import Foundation


class LoginView: UIView {

    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let divider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override var intrinsicContentSize: CGSize{
//        return CGSize(width: 200, height: 200)
//    }
}

extension LoginView{
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray5
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    func layout(){
        
        addSubview(stackView)
        [usernameTextField,divider,passwordTextField].forEach(stackView.addArrangedSubview)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true //Forma alternativa de activar constraints
    }
}

extension LoginView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
