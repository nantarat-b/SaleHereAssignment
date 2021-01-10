//
//  AchievementCollectionViewCell.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class AchievementCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var achievementImageView: UIImageView!
    @IBOutlet weak var achievementTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpCell()
        self.setUpAchievementTitle()
    }
    
    private func setUpCell() {
        self.contentView.layer.cornerRadius = 1.0
        self.contentView.layer.borderWidth = 1.5
        self.contentView.layer.borderColor = #colorLiteral(red: 0.8428929448, green: 0.2947521806, blue: 0.1831774116, alpha: 1).cgColor
        self.contentView.layer.masksToBounds = true
    }
    
    private func setUpAchievementTitle() {
        self.achievementTitleLabel.adjustsFontSizeToFitWidth = true
        self.achievementTitleLabel.minimumScaleFactor = 0.2
    }
    
    func configCell(data: AchievementViewModel) {
        self.achievementImageView.image = UIImage(named: data.iconImage)
        self.achievementTitleLabel.text = data.title
    }
}
