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
//    var blueColor = UIColor(hex: 04244b)
   // max 250 char
    // سيء /مقبول/ جيد//
    
    
    
    
    var body: some View {
        
        ZStack{
            Image("background-1").resizable().scaledToFill().scaledToFit()
            
            VStack{
                Spacer()
                Text("كيف كانت تجربتك؟").font(.custom("riesling", size: 60)).foregroundColor(.white)
                
                HStack{
                    Spacer()
                    CustomButton(
                        
                        status: "bad",
                        icon: Image("bad-1")
                    ) {
                        
                        viewModel.addReview(status: "bad")
                        print("bad Clicked!")
                    }
                    Spacer()
                    
                    CustomButton(
                        status: "ok",
                        icon: Image("ok-1")
                    ) {
                        viewModel.addReview(status: "ok")
                        print("ok Clicked!")
                    }
                    Spacer()
                    CustomButton(
                        status: "good",
                        icon: Image("good-1")
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
                    Text("example.com").font(.system(size: 30)).foregroundColor(.white)
                    
                    Spacer()
                    
                    
                    Image("mail").resizable().frame(width: 32.0, height: 32.0)
                    Text("example.com").font(.system(size: 30)).foregroundColor(.white)
                    
                    Spacer()
                    
                    Image("instagram").resizable().frame(width: 32.0, height: 32.0)
                    Text("example.com").font(.system(size: 30)).foregroundColor(.white)
                    
                    Spacer()
                    
                }.padding(.bottom, 20)
            }
        }.background(.red)
        //background(color: blueColor)
    }
}

struct SubmitReviewView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitReviewView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
