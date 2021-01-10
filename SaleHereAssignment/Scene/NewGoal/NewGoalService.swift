//
//  NewGoalService.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 10/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit

class NewGoalService {

    // MARK: - Calling API Manager
    func getGoalList(success: @escaping ([NewGoalListModel]) -> (), fail: @escaping (_ error: String?) -> ()) {
        let dataMock: [NewGoalListModel] = [
            NewGoalListModel(iconImage: "ic-travel", title: "Travel"),
            NewGoalListModel(iconImage: "ic-education", title: "Education"),
            NewGoalListModel(iconImage: "ic-invest", title: "Invest"),
            NewGoalListModel(iconImage: "ic-clothing", title: "Clothing"),
            NewGoalListModel(iconImage: "ic-other", title: "Other")
        ]
        success(dataMock)
    }

}
