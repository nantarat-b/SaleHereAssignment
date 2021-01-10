//
//  GoalsCollectionViewCell.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class GoalsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var discountPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var progressBar: BaseProgress!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var expiredDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpCell()
        self.setUpIconImageView()
        self.setUpDiscountPriceLabel()
        self.setUpPriceLabel()
        self.setUpTitleLabel()
        self.setUpStatusLabel()
        self.setUpExpiredDateLabel()
    }
    
    private func setUpCell() {
        self.contentView.layer.cornerRadius = 13.0
        self.contentView.layer.borderWidth = 3.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 8.0
        self.layer.shadowOpacity = 0.15
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        self.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    private func setUpIconImageView() {
        self.iconImageView.image = self.iconImageView.image?.withRenderingMode(.alwaysTemplate)
        self.iconImageView.tintColor = #colorLiteral(red: 0.78613168, green: 0.364203155, blue: 0.2807894945, alpha: 1)
    }
    
    private func setUpDiscountPriceLabel() {
        self.discountPriceLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        self.discountPriceLabel.textColor = #colorLiteral(red: 0.78613168, green: 0.364203155, blue: 0.2807894945, alpha: 1)
        self.discountPriceLabel.adjustsFontSizeToFitWidth = true
        self.discountPriceLabel.minimumScaleFactor = 0.2
    }
    
    private func setUpPriceLabel() {
        self.priceLabel.font = UIFont.systemFont(ofSize: 12.0)
        self.priceLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.priceLabel.adjustsFontSizeToFitWidth = true
        self.priceLabel.minimumScaleFactor = 0.2
    }
    
    private func setUpTitleLabel() {
        self.titleLabel.font = UIFont.systemFont(ofSize: 17.0)
        self.titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private func setUpStatusLabel() {
        self.statusLabel.font = UIFont.boldSystemFont(ofSize: 10.0)
        self.statusLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private func setUpExpiredDateLabel() {
        self.expiredDateLabel.font = UIFont.systemFont(ofSize: 10.0)
        self.expiredDateLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private func setGoodStatusStyle() {
        self.contentView.layer.borderColor = #colorLiteral(red: 0.1017802134, green: 0.4736685157, blue: 0.006756835617, alpha: 1).cgColor
        self.statusLabel.textColor = #colorLiteral(red: 0.1017802134, green: 0.4736685157, blue: 0.006756835617, alpha: 1)
    }
    
    private func setUnHappyStatusStyle() {
        self.contentView.layer.borderColor = #colorLiteral(red: 0.7785497308, green: 0.2887403965, blue: 0.03114439733, alpha: 1).cgColor
        self.statusLabel.textColor = #colorLiteral(red: 0.9368287325, green: 0.3803381026, blue: 0.05421607196, alpha: 1)
    }
    
    public func configCell(by data: GoalViewModel) {
        self.iconImageView.image = UIImage(named: data.iconImage)?.withRenderingMode(.alwaysTemplate)
        self.discountPriceLabel.text = data.discountPrice
        self.priceLabel.text = data.price
        self.progressBar.setPercent(value: data.progressPercent)
        self.progressBar.layoutIfNeeded()
        self.titleLabel.text = data.title
        self.statusLabel.text = data.riskType.rawValue
        self.expiredDateLabel.text = data.expiredDate
        
        switch data.riskType {
        case .good:
            self.setGoodStatusStyle()
        case .unhappy:
            self.setUnHappyStatusStyle()
        }
    }
}
