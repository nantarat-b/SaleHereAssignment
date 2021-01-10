//
//  AchievementService.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class AchievementService {
    func getAchievement(success: @escaping ([AchievementModel]) -> (), fail: @escaping (_ error: String?) -> ()) {
        var  dataMock: [AchievementModel] = []
        for _ in 1...8 {
            dataMock.append(AchievementModel(iconImage: "ic-medal", title: "Achievement"))
        }
        success(dataMock)
    }
}
