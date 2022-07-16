//
//  File.swift
//  Deers
//
//  Created by Dalal Macbook on 16/07/2022.
//

import Foundation

struct IdentifiableSocialMedia: Identifiable {
    var id = UUID()
    var icon: String
    var name: String
}
