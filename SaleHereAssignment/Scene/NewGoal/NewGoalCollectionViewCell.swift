//
//  NewGoalCollectionViewCell.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 10/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class NewGoalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var newGoalImageView: UIImageView!
    @IBOutlet weak var newGoalTitleLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpCell()
        self.setUpNewGoalTitle()
        self.setUpIconImageView()
        self.setUpBorderColor()
        self.setUpBackGroundColor()
    }
    
    private func setUpCell() {
        self.contentView.layer.cornerRadius = 13.0
        self.contentView.layer.borderWidth = 3.0
        self.contentView.layer.masksToBounds = true
        self.setUpBorderColor()
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.25
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        self.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    private func setUpBorderColor(isActive: Bool = false) {
        self.contentView.layer.borderColor = isActive ? UIColor.clear.cgColor : #colorLiteral(red: 0.7905176878, green: 0.3638026416, blue: 0.2900270522, alpha: 1).cgColor
    }
    
    private func setUpNewGoalTitle(isActive: Bool = false) {
        self.newGoalTitleLabel.textColor = isActive ? .white : .black
        self.newGoalTitleLabel.font = UIFont.systemFont(ofSize: 14.0)
    }
    
    private func setUpIconImageView(isActive: Bool = false) {
        self.newGoalImageView.image = self.newGoalImageView.image?.withRenderingMode(.alwaysTemplate)
        self.newGoalImageView.tintColor = isActive ? .white : #colorLiteral(red: 0.7905176878, green: 0.3638026416, blue: 0.2900270522, alpha: 1)
    }
    
    private func setUpBackGroundColor(isActive: Bool = false) {
        self.bgView.backgroundColor = isActive ? #colorLiteral(red: 0.7905176878, green: 0.3638026416, blue: 0.2900270522, alpha: 1) : .white
    }
    
    func configCell(data: NewGoalListViewModel, isActive: Bool) {
        self.setUpCell()
        self.newGoalImageView.image = UIImage(named: data.iconImage)?.withRenderingMode(.alwaysTemplate)
        self.newGoalTitleLabel.text = data.title
        
        self.setUpNewGoalTitle(isActive: isActive)
        self.setUpIconImageView(isActive: isActive)
        self.setUpBorderColor(isActive: isActive)
        self.setUpBackGroundColor(isActive: isActive)
    }
}
