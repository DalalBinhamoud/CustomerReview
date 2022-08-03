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
        Button(action: clicked) {
            HStack {
                icon.resizable().scaledToFit().scaledToFill()
            }
        
        }
    }
}
