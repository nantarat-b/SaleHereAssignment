//
//  BaseTextField.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 10/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class BaseTextField: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var unitTitleLabel: UILabel!
    @IBOutlet weak var inputField: BasePaddingTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
        self.setUpBackgroundView()
        self.setUpUnitTitleLabel()
        self.setUpInputField()
    }
    
    private func setupView() {
        Bundle(for: BaseTextField.self).loadNibNamed("BaseTextField", owner: self, options: nil)
        self.backgroundColor = .clear
        self.addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    private func setUpBackgroundView() {
        self.bgView.layer.cornerRadius = 1.0
        self.bgView.layer.borderWidth = 1.0
        self.bgView.layer.masksToBounds = true
        self.bgView.layer.borderColor = #colorLiteral(red: 0.7905176878, green: 0.3638026416, blue: 0.2900270522, alpha: 1).cgColor
    }
    
    private func setUpUnitTitleLabel() {
        self.unitTitleLabel.isUserInteractionEnabled = true
        self.unitTitleLabel.textColor = #colorLiteral(red: 0.7905176878, green: 0.3638026416, blue: 0.2900270522, alpha: 1)
        self.unitTitleLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        self.unitTitleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.focusTextField)))
    }
    
    private func setUpInputField() {
        self.inputField.tintColor = #colorLiteral(red: 0.7905176878, green: 0.3638026416, blue: 0.2900270522, alpha: 1)
        self.inputField.font = UIFont.systemFont(ofSize: 20.0, weight: .medium)
    }
    
    @objc func focusTextField() {
        self.inputField.becomeFirstResponder()
    }
    
    public func setUnitText(text: String) {
        self.unitTitleLabel.text = text
    }
    
    public func setPlaceHolderText(text: String) {
        self.inputField.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4744605422, green: 0.4745442867, blue: 0.4744495153, alpha: 1)]
        )
    }
}
