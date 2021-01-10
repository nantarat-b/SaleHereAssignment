//
//  NewGoalViewController.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 10/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit
import TakoBase

class NewGoalViewController: BaseViewController {

    let presenter: NewGoalPresenter = NewGoalPresenter(service: NewGoalService())

    override func awakeFromNib() {
        super.awakeFromNib()
    
        presenter.attachView(view: self)
        presenter.attachRouter(router: self)
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.getSomething()
    }
}

// MARK: - NewGoalViewController
extension NewGoalViewController: NewGoalView {
    func displaySomething(displayModel: NewGoalViewModel) {
        // TODO: Update UI
    }
}

// MARK: - NewGoalViewController
extension NewGoalViewController: NewGoalRouter {
    func navigateToViewController() {
        performSegue(aIdentifier: "") { (aDestination) in
            // TODO: Navigate to viewController
        }
    }
}
