//
//  HomeViewModel.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

struct HomeViewModel {
    
    struct GoalViewModel {
        let items: [GoalViewModel]
    }
}

struct GoalModel {
    let iconImage: String
    let discountPrice: Float
    let price: Float
    let riskLevel: Int
    let title: String
    let expiredDate: String
}

struct GoalViewModel {
    let iconImage: String
    let discountPrice: Float
    let price: Float
    let riskLevel: Int
    let riskType: RiskType
    let title: String
    let expiredDate: String
}

enum RiskType {
    case Good
    case Unhappy
}
