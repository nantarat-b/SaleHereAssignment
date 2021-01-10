//
//  BaseTools.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class BaseTools {
    class func getSafeAreaTopHeight() -> CGFloat {
        var topPadding: CGFloat = 0
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            if let padding = window?.safeAreaInsets.top {
                topPadding = padding
            }
        }
        return topPadding
    }
}
