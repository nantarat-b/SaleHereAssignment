//
//  BaseHorizontalCollectionView.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class BaseHorizontalCollectionView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var baseHorizontalCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    public var baseHorizontalCollectionItems: [String] = [] {
        didSet {
            self.baseHorizontalCollectionView.reloadData()
        }
    }
    
    public var baseHorizontalCollectionTitle: String = "" {
        didSet {
            self.titleLabel.text = self.baseHorizontalCollectionTitle
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
        self.setupBaseHorizontalCollectionView()
        self.setupTitleLabel()
    }
    
    private func setupView() {
        Bundle(for: BaseHorizontalCollectionView.self).loadNibNamed("BaseHorizontalCollectionView", owner: self, options: nil)
        self.backgroundColor = .clear
        
        self.addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    private func setupBaseHorizontalCollectionView() {
        self.baseHorizontalCollectionView.showsHorizontalScrollIndicator = false
        self.baseHorizontalCollectionView.delegate = self
        self.baseHorizontalCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 150)
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        
        self.baseHorizontalCollectionView.collectionViewLayout = layout
        self.baseHorizontalCollectionView.register(
            UINib(nibName: "BaseHorizontalCollectionViewCell", bundle: Bundle(for: BaseHorizontalCollectionViewCell.self)),
            forCellWithReuseIdentifier: "BaseHorizontalCollectionViewCell"
        )
    }
    
    private func setupTitleLabel() {
        self.titleLabel.font = UIFont.systemFont(ofSize: 19.0, weight: .medium)
        self.titleLabel.textColor = .black
    }
}

extension BaseHorizontalCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.baseHorizontalCollectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.baseHorizontalCollectionView.dequeueReusableCell(withReuseIdentifier: "BaseHorizontalCollectionViewCell", for: indexPath) as! BaseHorizontalCollectionViewCell
        cell.setCoverImage(imageName: self.baseHorizontalCollectionItems[indexPath.item])
        return cell
    }
}

extension BaseHorizontalCollectionView: UICollectionViewDelegate {
    
}

extension BaseHorizontalCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 16, bottom: 0, right: 16)
    }
}
