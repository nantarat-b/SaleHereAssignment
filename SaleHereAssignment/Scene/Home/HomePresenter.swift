//
//  HomePresenter.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

protocol HomeRouter: NSObjectProtocol {
    func navigateToViewController()
}

protocol HomeView: BaseView {
    func displaySomething(displayModel: HomeViewModel)
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
    
    func getSomething() {
        // TODO: Format the response from the Service and pass the result back to the View Controller
        let viewModel = HomeViewModel()
        view.displaySomething(displayModel: viewModel)
    }
}

