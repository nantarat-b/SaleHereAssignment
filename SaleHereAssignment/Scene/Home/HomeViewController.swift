//
//  HomeViewController.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit
import TakoBase

class HomeViewController: BaseViewController {

    let presenter: HomePresenter = HomePresenter(service: HomeService())

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

// MARK: - HomeViewController
extension HomeViewController: HomeView {
    func displaySomething(displayModel: HomeViewModel) {
        // TODO: Update UI
    }
}

// MARK: - HomeViewController
extension HomeViewController: HomeRouter {
    func navigateToViewController() {
        performSegue(aIdentifier: "") { (aDestination) in
            // TODO: Navigate to viewController
        }
    }
}
