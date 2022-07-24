//
//  ContentView.swift
//  Deers
//
//  Created by Dalal Macbook on 30/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color(.systemGray5))
        
    }
    
    var body: some View {
        
        
        VStack {
            // custom header
            ZStack {
                Rectangle().fill(Constants.Colors.primaryColor).frame(width: .infinity, height: 100).ignoresSafeArea()
                
                HStack {
                    // make sure the battery is not hidden in real device
                    Image("background")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100).ignoresSafeArea()
                    Spacer()
                }
            }
            TabView{
                
                
                SubmitReviewView().tabItem {
                    Label("إضافة تقييم", systemImage: "square.and.pencil")
                }
                
                ReviewsView().tabItem {
                    Label("التقييمات", systemImage: "list.dash")
                }
                
                
            }
            .accentColor(Constants.Colors.secondaryColor)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
