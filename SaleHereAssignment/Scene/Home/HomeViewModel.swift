//
//  HomeViewModel.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

struct HomeViewModel {
    let totalGoals: String
    let savingPrice: String
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
    let discountPrice: String
    let price: String
    let progressPercent: CGFloat
    let riskType: RiskType
    let title: String
    let expiredDate: String
}

enum RiskType: String {
    case good = "Good"
    case unhappy = "Unhappy"
}

struct BestOfferModel {
    let title: String
    let coverImages: [String]
}

struct SuggestModel {
    let title: String
    let coverImages: [String]
}

struct OtherModel {
    let title: String
    let coverImages: [String]
}
