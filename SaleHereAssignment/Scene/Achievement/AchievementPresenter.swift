//
//  AchievementPresenter.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

protocol AchievementRouter: NSObjectProtocol {
    func navigateToViewController()
}

protocol AchievementView: BaseView {
    func displaySomething(displayModel: AchievementViewModel)
}

class AchievementPresenter {
    private var service: AchievementService!
    weak private var view: AchievementView!
    weak private var router : AchievementRouter!
    
    // MARK: - Initializers
    init(service: AchievementService) {
        self.service = service
    }
    
    func attachRouter(router: AchievementRouter) {
        self.router = router
    }
    
    func attachView(view: AchievementView) {
        self.view = view
    }
    
    func getSomething() {
        // TODO: Format the response from the Service and pass the result back to the View Controller
        let viewModel = AchievementViewModel()
        view.displaySomething(displayModel: viewModel)
    }
}

