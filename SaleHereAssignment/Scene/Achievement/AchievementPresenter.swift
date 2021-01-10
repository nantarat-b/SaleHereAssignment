//
//  AchievementPresenter.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

protocol AchievementRouter: NSObjectProtocol {
    
}

protocol AchievementView: BaseView {
    func displayAchievementList(displayModel: [AchievementViewModel])
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
    
    func getAchievement() {
        self.service.getAchievement { (achievementModel) in
            let achievementViewModel = achievementModel.map { (item) -> AchievementViewModel in
                return AchievementViewModel(iconImage: item.iconImage, title: item.title)
            }
            self.view.displayAchievementList(displayModel: achievementViewModel)
        } fail: { (error) in
            
        }
    }
}

