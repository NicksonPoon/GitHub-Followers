//
//  UIHelper.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/18/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import UIKit
 
enum UIHelper {
    static func createThreeColumnflowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let avaliableWidth = width - (padding * 2) - (minimumItemSpacing * 2 ) //  * 2 because of Padding on left and right of screen
        let itemWidth = avaliableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
