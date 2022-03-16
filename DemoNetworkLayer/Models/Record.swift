//
//  Record.swift
//  DemoNetworkLayer
//
//  Created by Paul on 2022/3/15.
//

import Foundation

struct Record:Codable {
    
    let id:Int
    var content:String
    var cost:Int
    var tag:String
    var datetime:String
}

struct Member:Codable {
    internal init(id: Int? = nil, name: String, phone: String, mail: String, point: Int) {
        self.id = id
        self.name = name
        self.phone = phone
        self.mail = mail
        self.point = point
    }
    
    let id:Int?
    let name:String
    let phone:String
    let mail:String
    let point:Int
}
