//
//  Constants.swift
//  Deers
//
//  Created by Dalal Macbook on 13/07/2022.
//

import SwiftUI

// allow using hex color
extension Color {
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}
struct Constants {
    struct Colors{
        static let primaryColor = Color(hex: "#ba952a")
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
