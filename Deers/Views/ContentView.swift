//
//  ContentView.swift
//  Deers
//
//  Created by Dalal Macbook on 30/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        
        TabView{
            
    
            SubmitReviewView().tabItem {
                Label("Add Review", systemImage: "square.and.pencil")
            }
            
            ReviewsView().tabItem {
                Label("Reviews", systemImage: "list.dash")
            }
            
        
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
