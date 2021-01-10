//
//  GoalsCollectionView.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class GoalsCollectionView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var goalsCollectionView: UICollectionView!
    
    public var goalItems: [GoalViewModel] = [] {
        didSet {
            self.goalsCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
        self.setupGoalsCollectionView()
    }
    
    private func setupView() {
        Bundle(for: GoalsCollectionView.self).loadNibNamed("GoalsCollectionView", owner: self, options: nil)
        self.backgroundColor = .clear
        
        self.addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    private func setupGoalsCollectionView() {
        self.goalsCollectionView.showsHorizontalScrollIndicator = false
        self.goalsCollectionView.delegate = self
        self.goalsCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 175, height: 175)
        layout.minimumInteritemSpacing = 24
        layout.minimumLineSpacing = 24
        layout.scrollDirection = .horizontal
        
        self.goalsCollectionView.collectionViewLayout = layout
        self.goalsCollectionView.register(
            UINib(nibName: "GoalsCollectionViewCell", bundle: Bundle(for: GoalsCollectionView.self)),
            forCellWithReuseIdentifier: "GoalsCollectionViewCell"
        )
    }
}

extension GoalsCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.goalItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.goalsCollectionView.dequeueReusableCell(withReuseIdentifier: "GoalsCollectionViewCell", for: indexPath) as! GoalsCollectionViewCell
        cell.configCell(by: self.goalItems[indexPath.item])
        return cell
    }
}

extension GoalsCollectionView: UICollectionViewDelegate {
    
}

extension GoalsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 175)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 24, bottom: 24, right: 24)
    }
}
