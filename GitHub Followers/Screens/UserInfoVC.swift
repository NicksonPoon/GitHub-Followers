//
//  UserInfoVC.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/23/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
        navigationItem.rightBarButtonItem = doneButton
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self ] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                print(user)
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something Went Wrong", message: error.rawValue, buttonTitle: "Ok")
            }
            
        }
    }
    
    @objc func doneButtonPressed() {
        dismiss(animated: true)
    }

}
