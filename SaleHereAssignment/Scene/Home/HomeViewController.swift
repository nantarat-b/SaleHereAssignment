//
//  HomeViewController.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var contentViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var goalContentView: BaseGradientView!
    @IBOutlet weak var goalPaddingView: UIView!
    @IBOutlet weak var goalPaddingHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var goalCollectionView: GoalsCollectionView!
    
    @IBOutlet weak var totalGoalsLabel: UILabel!
    @IBOutlet weak var allSavingLabel: UILabel!
    @IBOutlet weak var savingPriceLabel: UILabel!
    @IBOutlet weak var bahtLabel: UILabel!
    
    @IBOutlet weak var newGoalButton: BaseButton!
    
    @IBOutlet weak var bestOfferCollectionView: BaseHorizontalCollectionView!
    @IBOutlet weak var suggestCollectionView: BaseHorizontalCollectionView!
    @IBOutlet weak var otherCollectionView: BaseHorizontalCollectionView!
    
    let presenter: HomePresenter = HomePresenter(service: HomeService())

    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.presenter.attachView(view: self)
        self.presenter.attachRouter(router: self)
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpView()
        self.setUpTotalGoalsLabel()
        self.setUpAllSavingLabel()
        self.setUpSavingPriceLabel()
        self.setUpBahtLabel()
        self.setUpScrollView()
        self.setUpNewGoalButton()
        
        self.presenter.getGoalList()
        self.presenter.getBestOfferList()
        self.presenter.getSuggestList()
        self.presenter.getOtherList()
    }
    
    private func setUpView() {
        self.goalPaddingHeightConstraint.constant = self.getHeightTopArea()
        self.contentViewTopConstraint.constant = -self.getHeightTopArea()
    }
    
    private func setUpTotalGoalsLabel() {
        self.totalGoalsLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .medium)
        self.totalGoalsLabel.textColor = .white
    }
    
    private func setUpAllSavingLabel() {
        self.allSavingLabel.font = UIFont.systemFont(ofSize: 16.0)
        self.allSavingLabel.textColor = .white
        self.bahtLabel.text = "All Saving"
    }
    
    private func setUpSavingPriceLabel() {
        self.savingPriceLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        self.savingPriceLabel.textColor = .white
        self.savingPriceLabel.adjustsFontSizeToFitWidth = true
        self.savingPriceLabel.minimumScaleFactor = 0.2
    }
    
    private func setUpBahtLabel() {
        self.bahtLabel.font = UIFont.systemFont(ofSize: 16.0)
        self.bahtLabel.textColor = .white
        self.bahtLabel.text = "THB"
    }
    
    private func setUpScrollView() {
        self.scrollView.delegate = self
    }
    
    private func setUpNewGoalButton() {
        self.newGoalButton.addTarget(self, action: #selector(self.gotoNewGoalPage), for: .touchUpInside)
    }
    
    @objc func gotoNewGoalPage() {
        self.presenter.gotoNewGoalPage()
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view.backgroundColor = self.scrollView.contentOffset.y > 0 ? .white : #colorLiteral(red: 1, green: 0.7434143826, blue: 0, alpha: 1)
    }
}

// MARK: - HomeViewController
extension HomeViewController: HomeView {
    func displayHomeView(homeViewModel: HomeViewModel) {
        self.totalGoalsLabel.text = homeViewModel.totalGoals
        self.savingPriceLabel.text = homeViewModel.savingPrice
    }
    
    func displayGoalList(goalViewModels: [GoalViewModel]) {
        self.goalCollectionView.goalItems = goalViewModels
    }
    
    func displayBestOfferList(viewModel: BaseHorizontalCollectionViewModel) {
        self.bestOfferCollectionView.baseHorizontalCollectionItems = viewModel.coverImages
        self.bestOfferCollectionView.baseHorizontalCollectionTitle = viewModel.title
    }
    
    func displaySuggestList(viewModel: BaseHorizontalCollectionViewModel) {
        self.suggestCollectionView.baseHorizontalCollectionItems = viewModel.coverImages
        self.suggestCollectionView.baseHorizontalCollectionTitle = viewModel.title
    }
    
    func displayOtherList(viewModel: BaseHorizontalCollectionViewModel) {
        self.otherCollectionView.baseHorizontalCollectionItems = viewModel.coverImages
        self.otherCollectionView.baseHorizontalCollectionTitle = viewModel.title
    }
}

// MARK: - HomeViewController
extension HomeViewController: HomeRouter {
    func navigateToNewGoalViewController() {
        let storyboard = UIStoryboard(name: "NewGoalStoryboard", bundle: Bundle(for: HomeViewController.self))
        let newGoalViewController = storyboard.instantiateViewController(withIdentifier: "NewGoalStoryboard") as! NewGoalViewController
        self.navigationController?.pushViewController(newGoalViewController, animated: true)
    }
}
