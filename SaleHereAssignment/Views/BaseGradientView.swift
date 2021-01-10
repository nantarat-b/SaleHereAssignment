//
//  BaseGradientView.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class BaseGradientView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.setUpView()
    }
    
    private func setUpView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [#colorLiteral(red: 1, green: 0.7434143826, blue: 0, alpha: 1).cgColor, #colorLiteral(red: 0.7684475763, green: 0.5182858706, blue: 0, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.frame
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
