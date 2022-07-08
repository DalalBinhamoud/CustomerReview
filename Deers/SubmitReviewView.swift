//
//  SubmitReviewView.swift
//  Deers
//
//  Created by Dalal Macbook on 08/07/2022.
//

import SwiftUI
import FirebaseFirestore
import FirebaseDatabase

struct SubmitReviewView: View {
    @ObservedObject private var viewModel = ReviewsViewModel()
    @State var reviewCounter =  UserDefaults.standard.object(forKey: "counter")
    
    
    
    
    var body: some View {
        
        ZStack{
            Image("background").resizable().scaledToFit().opacity(0.25)
            
            VStack{
                Spacer()
                Text("كيف كانت تجربتك؟").font(.custom("riesling", size: 60))
                
                HStack{
                    Spacer()
                    CustomButton(
                        
                        status: "bad",
                        icon: Image("bad")
                    ) {
                        
                        viewModel.addReview(status: "bad")
                        print("bad Clicked!")
                    }
                    Spacer()
                    
                    CustomButton(
                        status: "ok",
                        icon: Image("ok")
                    ) {
                        viewModel.addReview(status: "ok")
                        print("ok Clicked!")
                    }
                    Spacer()
                    CustomButton(
                        status: "good",
                        icon: Image("good")
                    ) {
                        viewModel.addReview(status: "good")
                        print("good Clicked!")
                    }
                    
                    Spacer()
                    
                }
                Spacer()
                
                Divider()
                
                HStack{
                    Spacer()
                    
                    Image("twitter").resizable().frame(width: 32.0, height: 32.0)
                    Text("example.com").font(.system(size: 30))
                    
                    Spacer()
                    
                    
                    Image("mail").resizable().frame(width: 32.0, height: 32.0)
                    Text("example.com").font(.system(size: 30))
                    
                    Spacer()
                    
                    Image("instagram").resizable().frame(width: 32.0, height: 32.0)
                    Text("example.com").font(.system(size: 30))
                    
                    Spacer()
                    
                }
            }
        }
    }
}

struct SubmitReviewView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitReviewView()
    }
}
