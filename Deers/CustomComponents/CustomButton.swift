//
//  CustomButton.swift
//  Deers
//
//  Created by Dalal Macbook on 30/06/2022.
//

import Foundation
import SwiftUI

struct CustomButton: View {
    var status: String
    var icon: Image
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) { /// call the closure here
            HStack {
                icon
            }
            .frame(minWidth: 5, maxWidth: 5, minHeight: 10)
        }
    }
}
