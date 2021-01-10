//
//  NSNumberExtension.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import Foundation

extension Float {
    public func formattedString(minimumFractionDigits: Int, maximumFractionDigits: Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = minimumFractionDigits
        formatter.maximumFractionDigits = maximumFractionDigits
        formatter.minimumIntegerDigits = 1
        formatter.locale = Locale(identifier: "en_EN")
        formatter.numberStyle = .decimal
        
        let number: NSNumber = NSNumber(value: self)
        if let formattedString = formatter.string(from: number) {
            return formattedString
        }
        return ""
    }
}
