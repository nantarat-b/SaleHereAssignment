//
//  NewGoalPresenter.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 10/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

protocol NewGoalRouter: NSObjectProtocol {
    func navigateToHomeViewController()
}

protocol NewGoalView: BaseView {
    func displayGoalList(displayModel: [NewGoalListViewModel])
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
    
    func getGoalList() {
        self.service.getGoalList { (newGoalListModel) in
            let newGoalListViewModel = newGoalListModel.map { (item) -> NewGoalListViewModel in
                return NewGoalListViewModel(iconImage: item.iconImage, title: item.title)
            }
            self.view.displayGoalList(displayModel: newGoalListViewModel)
        } fail: { (error) in
            
        }
    }
    
    func saveNewGoal()  {
        self.router.navigateToHomeViewController()
    }
}

