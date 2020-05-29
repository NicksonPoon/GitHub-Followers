//
//  UserInfoVC.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/23/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import UIKit

protocol UserInfoVCDelegate: class {
    func didTapGitHubProfile(for user: User)
    func didTapGetFollowers(for user: User)
}

class UserInfoVC: UIViewController {
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlign: .center)
    var itemViews: [UIView] = []
    
    var username: String!
    weak var delegate: FollowerListVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        getUserInfo()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func getUserInfo(){
        NetworkManager.shared.getUserInfo(for: username) { [weak self ] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.configureUIElements(with: user) }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something Went Wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func configureUIElements(with user: User) {
        
        let repoItemVC = GFRepoItemVC(user: user)
        repoItemVC.delegate = self
        
        let followerItemVC = GFFollowerVC(user: user)
        followerItemVC.delegate = self
        
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
        self.add(childVC: repoItemVC, to: self.itemViewOne)
        self.add(childVC: followerItemVC, to: self.itemViewTwo)
        
        
        self.dateLabel.text = "GitHub User Since \((user.createdAt.converToDisplayFormat()))"
    }
    
    
    func layoutUI() {
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        itemViews = [headerView, itemViewOne, itemViewTwo, dateLabel]
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        }
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
    }
    
    func add(childVC: UIViewController, to containerVieW: UIView) {
        addChild(childVC)
        containerVieW.addSubview(childVC.view)
        childVC.view.frame = containerVieW.bounds
        childVC.didMove(toParent: self)
        
    }
    
    @objc func doneButtonPressed() {
        dismiss(animated: true)
    }
    
}


extension UserInfoVC: UserInfoVCDelegate {
    func didTapGitHubProfile(for user: User) {
        // Show Safari view controller
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "Invalid URL", buttonTitle: "OK")
            return
        }
        presentSafariVC(with: url)
    }
    
    
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No followers", message: "This user has no followers. Go Follow them! 😢", buttonTitle: "Ok")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        
        dismiss(animated: true)
    }
}

