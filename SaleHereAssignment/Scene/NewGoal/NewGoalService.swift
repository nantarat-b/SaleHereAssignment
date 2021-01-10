//
//  NewGoalService.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 10/1/2564 BE.
//  Copyright (c) 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit
import TakoBase

class NewGoalService {

    /*
    *if fail, return error code
    *if success, transform to models (raw)
    */
 
    // MARK: - Calling API Manager
    func doSomeWork(success: @escaping (Any) -> (), fail: @escaping (_ error: String?) -> ()) {

        // TODO: Do the work
        let api = APIManager.init(endpoint: "",
                                  method: .get)
        api.call(parameters: [:],
                 headersAdditional: [:],
                 encoding: nil,
                 fail: { (error) in
                    fail("error")
        }) { (json) in
            if (json["code"].string == "success") {
                // TODO: Format the response from the Api and pass the result back to the Presenter
                success("")
            }
        }
    }
}
