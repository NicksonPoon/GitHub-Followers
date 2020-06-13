//
//  UITableView+Ext.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 6/12/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import UIKit

extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
