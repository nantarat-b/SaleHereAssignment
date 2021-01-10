//
//  BaseButton.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

public class BaseButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpButton()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpButton()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.setUpButton()
    }
    
    func setUpButton() {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        self.layer.cornerRadius = 8.0
        self.backgroundColor = #colorLiteral(red: 0.7861317396, green: 0.3642032444, blue: 0.2855415344, alpha: 1)
        self.setTitleColor(.white, for: .normal)
    }
}
