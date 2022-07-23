//
//  Constants.swift
//  Deers
//
//  Created by Dalal Macbook on 13/07/2022.
//

import SwiftUI

struct Constants {
    
    struct Colors{
        static let primaryColor = Color(red: 0.01568627450980392, green: 0.1411764705882353, blue: 0.29411764705882354)
        static let  secondaryColor = Color(red: 0.01568627450980392, green: 0.1411764705882353, blue: 0.29411764705882354)
        static let labelColor = Color.white
    }
    
    struct fixedLists {
        static let btnStatus = [
            IdentifiableStatus(status: "bad"),
            IdentifiableStatus(status: "ok"),
            IdentifiableStatus(status: "good")
        ]
        static let socialMediaContent = [
            IdentifiableSocialMedia(icon: "twitter", name: "deersksa"),
            IdentifiableSocialMedia(icon: "snapchat", name: "deers.ksa"),
            IdentifiableSocialMedia(icon: "instagram", name: "deers.ksa")
        ]
    }
    
    struct reviewStatus {
        static let bad = "سيء"
        static let ok = "مقبول"
        static let good = "جيد"
    }
    
    struct maxLength {
        static let textEditor = 250
        static let textLines = 4
    }
}
