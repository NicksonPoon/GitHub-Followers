//
//  String+Ext.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/29/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import Foundation

extension String {
    
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    }
    
    func converToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A" }
            return date.convertToMonthYearFormat()
        }
}

