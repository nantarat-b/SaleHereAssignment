//
//  BaseHorizontalCollectionViewCell.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class BaseHorizontalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var coverImage: UIImageView!
    
    public func setCoverImage(imageName: String) {
        self.coverImage.image = UIImage(named: imageName)
    }
}
