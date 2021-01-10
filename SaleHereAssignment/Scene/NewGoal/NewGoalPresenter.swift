//
//  NewGoalPresenter.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 10/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

protocol NewGoalRouter: NSObjectProtocol {
    func navigateToViewController()
}

protocol NewGoalView: BaseView {
    func displaySomething(displayModel: NewGoalViewModel)
}

class NewGoalPresenter {
    private var service: NewGoalService!
    weak private var view: NewGoalView!
    weak private var router : NewGoalRouter!
    
    // MARK: - Initializers
    init(service: NewGoalService) {
        self.service = service
    }
    
    func attachRouter(router: NewGoalRouter) {
        self.router = router
    }
    
    func attachView(view: NewGoalView) {
        self.view = view
    }
    
    func getSomething() {
        // TODO: Format the response from the Service and pass the result back to the View Controller
        let viewModel = NewGoalViewModel()
        view.displaySomething(displayModel: viewModel)
    }
}

