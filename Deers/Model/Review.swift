//
//  Review.swift
//  Deers
//
//  Created by Dalal Macbook on 30/06/2022.
//

import Foundation

struct Review: Identifiable {
//    var id: ObjectIdentifier
    var id: String
    var status: String
    var date : String
    var time : String
}

struct IdentifiableStatus: Identifiable {
    var id = UUID()
    var status: String
}

enum Status: String {
    case bad = "bad"
    case ok = "ok"
    case good = "good"
}
