//
//  Date+Ext.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/29/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import Foundation

//String -> Date -> String
extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
    
}
