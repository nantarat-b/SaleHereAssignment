//
//  NSNumberExtension.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import Foundation

extension NSNumber {
    public func formattedNumberString(minimumFractionDigits: Int, maximumFractionDigits: Int) -> String {
        return formattedNumberString(minimumFractionDigits: minimumFractionDigits,
                                     maximumFractionDigits: maximumFractionDigits,
                                     showSign: false)
    }
}
