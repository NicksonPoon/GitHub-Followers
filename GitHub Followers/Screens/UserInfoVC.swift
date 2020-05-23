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
        
        print(username!)
    }
    
    @objc func doneButtonPressed() {
        dismiss(animated: true)
    }

}
