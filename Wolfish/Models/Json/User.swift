//
//  User.swift
//  Wolfish
//
//  Created by Petre Vane on 08/12/2020.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var emailAddress = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefill = false
}
