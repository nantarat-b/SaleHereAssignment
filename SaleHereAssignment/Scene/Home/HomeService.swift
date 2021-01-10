//
//  HomeService.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class HomeService {
    func getGoalList(success: @escaping ([GoalModel]) -> (), fail: @escaping (_ error: String?) -> ()) {
        let goalItems = [
            GoalModel(
                iconImage: "ic-money-bag",
                discountPrice: 16500,
                price: 20000,
                riskLevel: 65,
                title: "ไปเที่ยวญี่ปุ่น",
                expiredDate: "45"
            ),
            GoalModel(
                iconImage: "ic-planet-earth",
                discountPrice: 500,
                price: 6000,
                riskLevel: 25,
                title: "ซื้อกองทุนรวม",
                expiredDate: "20"
            ),
            GoalModel(
                iconImage: "ic-money-bag",
                discountPrice: 20500,
                price: 23500,
                riskLevel: 90,
                title: "ไปทะเล",
                expiredDate: "17"
            )
        ]
        success(goalItems)
    }
    
    func getBestOfferList(success: @escaping (BestOfferModel) -> (), fail: @escaping (_ error: String?) -> ()) {
        success(BestOfferModel(
                    title: "Best Offer",
                    coverImages: ["pexels-aleksandar-pasaric", "pexels-belle-co", "pexels-catarina-sousa"])
        )
    }
    
    func getSuggestList(success: @escaping (SuggestModel) -> (), fail: @escaping (_ error: String?) -> ()) {
        success(SuggestModel(
                    title: "Suggest for you",
                    coverImages: ["pexels-nicolas-postiglioni", "pexels-nubia-navarro", "pexels-pixabay-sun"])
        )
    }
    
    func getOtherList(success: @escaping (OtherModel) -> (), fail: @escaping (_ error: String?) -> ()) {
        success(OtherModel(
                    title: "Others",
                    coverImages: ["pexels-pixabay", "pexels-veerasak-piyawatanakul"])
        )
    }
}
