//
//  NotificationManagement.swift
//  SaleHereAssignment
//
//  Created by Nantarat Buranajinda on 10/1/2564 BE.
//  Copyright © 2564 BE SaleHereAssignment. All rights reserved.
//

import Foundation
import SocketIO

protocol NotificationManagementDelegate: NSObjectProtocol {
    func onConnect()
    func onDisconnect()
    func onUpdateBadge(badge: Int)
}

extension NotificationManagementDelegate {
    func onConnect() {}
    func onDisconnect() {}
}

class NotificationManagement: NSObject {
    private var manager: SocketManager?
    private var socket: SocketIOClient?
    public weak var delegate: NotificationManagementDelegate?
    
    enum NotificationClientEvent: String {
        case newNotification = "new-notification"
    }

    init(socketURL: String) {
        self.manager = SocketManager(socketURL: URL(string: socketURL)!, config: [.log(true), .compress])
        self.socket = self.manager?.defaultSocket
    }
    
    func connect() {
        self.socket?.on(clientEvent: .connect) {data, ack in
            self.delegate?.onConnect()
            self.delegate?.onUpdateBadge(badge: self.getBadge())
        }
        
        self.socket?.on(NotificationClientEvent.newNotification.rawValue) {data, ack in
            self.updateBadge()
            self.delegate?.onUpdateBadge(badge: self.getBadge())
        }
        
        self.socket?.on(clientEvent: .disconnect) {data, ack in
            self.delegate?.onDisconnect()
        }
        
        self.socket?.connect()
    }
    
    func disconnect() {
        self.socket?.disconnect()
    }
    
    private func getBadge() -> Int {
        return UserDefaults.standard.integer(forKey: NotificationClientEvent.newNotification.rawValue)
    }
    
    private func updateBadge() {
        let badge = self.getBadge() + 1
        UserDefaults.standard.set(badge, forKey: NotificationClientEvent.newNotification.rawValue)
    }
    
    private func resetBadge() {
        let badge = 0
        UserDefaults.standard.set(badge, forKey: NotificationClientEvent.newNotification.rawValue)
    }
}
