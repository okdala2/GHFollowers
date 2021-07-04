//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Dala  on 7/3/21.
//

import UIKit

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MMM yyyy"
        
        return dateformatter.string(from: self)
    }
}
