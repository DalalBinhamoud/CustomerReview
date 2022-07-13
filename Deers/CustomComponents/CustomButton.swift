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
                icon.resizable().frame(minWidth: 10, maxWidth: 200, maxHeight: 200)
            }
        
        }
    }
}
