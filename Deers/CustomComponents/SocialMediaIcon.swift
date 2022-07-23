//
//  SocialMediaIcon.swift
//  Deers
//
//  Created by Dalal Macbook on 13/07/2022.
//

import Foundation
import SwiftUI



struct SocialMediaIcon: View {
    var iconName: String
    var name: String
    
    var body: some View {
        HStack{
            Image(iconName).resizable().frame(width: 32.0, height: 32.0)
            Text(name).font(.system(size: 30)).foregroundColor(Constants.Colors.secondaryColor)
        }
    }
}
