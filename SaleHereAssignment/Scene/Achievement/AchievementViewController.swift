//
//  AchievementViewController.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit
import TakoBase

class AchievementViewController: BaseViewController {

    let presenter: AchievementPresenter = AchievementPresenter(service: AchievementService())

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

// MARK: - AchievementViewController
extension AchievementViewController: AchievementView {
    func displaySomething(displayModel: AchievementViewModel) {
        // TODO: Update UI
    }
}

// MARK: - AchievementViewController
extension AchievementViewController: AchievementRouter {
    func navigateToViewController() {
        performSegue(aIdentifier: "") { (aDestination) in
            // TODO: Navigate to viewController
        }
    }
}
