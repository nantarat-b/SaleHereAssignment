//
//  HomePresenter.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

protocol HomeRouter: NSObjectProtocol {
    func navigateToNewGoalViewController()
}

protocol HomeView: BaseView {
    func displayHomeView(homeViewModel: HomeViewModel)
    func displayGoalList(goalViewModels: [GoalViewModel])
    func displayBestOfferList(viewModel: BaseHorizontalCollectionViewModel)
    func displaySuggestList(viewModel: BaseHorizontalCollectionViewModel)
    func displayOtherList(viewModel: BaseHorizontalCollectionViewModel)
}

class HomePresenter {
    private var service: HomeService!
    weak private var view: HomeView!
    weak private var router : HomeRouter!
    
    // MARK: - Initializers
    init(service: HomeService) {
        self.service = service
    }
    
    func attachRouter(router: HomeRouter) {
        self.router = router
    }
    
    func attachView(view: HomeView) {
        self.view = view
    }
    
    func getGoalList() {
        self.service.getGoalList { goalItems in
            let goalViewModelItems = goalItems.map { (goalModel) -> GoalViewModel in
                let progressPercent = Float(goalModel.riskLevel) / 100.0
                return GoalViewModel(
                    iconImage: goalModel.iconImage,
                    discountPrice: goalModel.discountPrice.formattedString(minimumFractionDigits: 0, maximumFractionDigits: 0),
                    price: goalModel.price.formattedString(minimumFractionDigits: 0, maximumFractionDigits: 0),
                    progressPercent: CGFloat(progressPercent),
                    riskType: (goalModel.riskLevel > 50) ? .good : .unhappy,
                    title: goalModel.title,
                    expiredDate: goalModel.expiredDate + " days left"
                )
            }
            
            let savingPrice = goalItems.reduce(0) { (result, goalModel) -> Float in
                return result + goalModel.discountPrice
            }
            
            self.view.displayHomeView(homeViewModel: HomeViewModel(
                totalGoals: "\(goalViewModelItems.count) Goals",
                savingPrice: savingPrice.formattedString(minimumFractionDigits: 0, maximumFractionDigits: 0))
            )
            
            self.view.displayGoalList(goalViewModels: goalViewModelItems)
        } fail: { (error) in
            
        }

    }
    
    func getBestOfferList() {
        self.service.getBestOfferList { (bestOfferModel) in
            self.view.displayBestOfferList(
                viewModel: BaseHorizontalCollectionViewModel(
                    title: bestOfferModel.title,
                    coverImages: bestOfferModel.coverImages
                )
            )
        } fail: { (error) in
            
        }
    }
    
    func getSuggestList() {
        self.service.getSuggestList { (suggestModel) in
            self.view.displaySuggestList(
                viewModel: BaseHorizontalCollectionViewModel(
                    title: suggestModel.title,
                    coverImages: suggestModel.coverImages
                )
            )
        } fail: { (error) in
            
        }
    }
    
    func getOtherList() {
        self.service.getOtherList { (otherModel) in
            self.view.displayOtherList(
                viewModel: BaseHorizontalCollectionViewModel(
                    title: otherModel.title,
                    coverImages: otherModel.coverImages
                )
            )
        } fail: { (error) in
            
        }
    }
    
    func gotoNewGoalPage() {
        self.router.navigateToNewGoalViewController()
    }
}

