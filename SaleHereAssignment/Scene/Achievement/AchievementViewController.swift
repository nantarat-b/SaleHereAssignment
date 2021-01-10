//
//  AchievementViewController.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class AchievementViewController: BaseViewController {

    @IBOutlet weak var achievementTitleLabel: UILabel!
    @IBOutlet weak var achievementLevelLabel: UILabel!
    @IBOutlet weak var achievementImageView: UIImageView!
    @IBOutlet weak var achievementCollectionView: UICollectionView!
    
    private var achievementItems :[AchievementViewModel] = []
    let presenter: AchievementPresenter = AchievementPresenter(service: AchievementService())

    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.presenter.attachView(view: self)
        self.presenter.attachRouter(router: self)
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpView()
        self.setUpAchievementTitleLabel()
        self.setUpAchievementLevelLabel()
        self.setUpAchievementImageView()
        self.setUpAchievementCollectionView()
        
        self.presenter.getAchievement()
    }
    
    private func setUpView() {
        self.navigationController?.navigationBar.hideShadow(true)
    }
    
    private func setUpAchievementTitleLabel() {
        self.achievementTitleLabel.text = "Achievement"
        self.achievementTitleLabel.font = UIFont.systemFont(ofSize: 24.0, weight: .medium)
        self.achievementTitleLabel.textColor = .white
    }
    
    private func setUpAchievementLevelLabel() {
        self.achievementLevelLabel.font = UIFont.systemFont(ofSize: 32.0, weight: .medium)
        self.achievementLevelLabel.textColor = .white
    }
    
    private func setUpAchievementImageView() {
        self.achievementImageView.image = UIImage(named: "ic-big-star")?.withRenderingMode(.alwaysTemplate)
        self.achievementImageView.tintColor = .white
    }
    
    private func setUpAchievementCollectionView() {
        self.achievementCollectionView.showsHorizontalScrollIndicator = false
        self.achievementCollectionView.delegate = self
        self.achievementCollectionView.dataSource = self
  
        let size = self.getSizeAchievementCollectionViewCell()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: size, height: size)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 24
        layout.scrollDirection = .vertical
        
        self.achievementCollectionView.collectionViewLayout = layout
        self.achievementCollectionView.register(
            UINib(nibName: "AchievementCollectionViewCell", bundle: Bundle(for: AchievementCollectionViewCell.self)),
            forCellWithReuseIdentifier: "AchievementCollectionViewCell"
        )
    }
    
    private func getSizeAchievementCollectionViewCell() -> CGFloat {
        return (UIScreen.main.bounds.width - 48 - 16) / 3.0
    }
}

extension AchievementViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.achievementItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.achievementCollectionView.dequeueReusableCell(withReuseIdentifier: "AchievementCollectionViewCell", for: indexPath) as! AchievementCollectionViewCell
        cell.configCell(data: self.achievementItems[indexPath.item])
        return cell
    }
}

extension AchievementViewController: UICollectionViewDelegate {
    
}

extension AchievementViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.getSizeAchievementCollectionViewCell()
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 24, left: 24, bottom: 24, right: 24)
    }
}


// MARK: - AchievementViewController
extension AchievementViewController: AchievementView {
    func displayAchievementList(displayModel: [AchievementViewModel]) {
        self.achievementItems = displayModel
        self.achievementCollectionView.reloadData()
    }
}

// MARK: - AchievementViewController
extension AchievementViewController: AchievementRouter {
    
}
