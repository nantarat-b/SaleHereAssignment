//
//  BaseTabBarController.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 9/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import UIKit
import SocketIO

class BaseTabBarController: UITabBarController {
    
    let notificationManagement = NotificationManagement(socketURL: "wss://px-socket-api.herokuapp.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sutUpSocketIO()
    }
    
    deinit {
        self.notificationManagement.disconnect()
    }
    
    private func sutUpSocketIO() {
        self.notificationManagement.connect()
        self.notificationManagement.delegate = self
    }
}

extension BaseTabBarController: NotificationManagementDelegate {
    func onUpdateBadge(badge: Int) {
        self.tabBar.items?[3].badgeValue = (badge > 0) ? String(badge) : nil
    }
}
