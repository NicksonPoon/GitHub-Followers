//
//  SearchVC.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/14/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let followersButtonPressed = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureFollowersButtonPressed()
        dismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func dismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func pushFollowerListVC() {
        
        guard isUsernameEntered  else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please Enter a Username. We need to know who to search for! 😄 ", buttonTitle: "OK")
            return
        }
        
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
        
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate( [
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureFollowersButtonPressed() {
        view.addSubview(followersButtonPressed)
        followersButtonPressed.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            followersButtonPressed.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            followersButtonPressed.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            followersButtonPressed.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            followersButtonPressed.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
