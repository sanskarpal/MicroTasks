//
//  User.swift
//  MicroTasks
//
//  Created by Sanskar Pal on 7/12/23.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
