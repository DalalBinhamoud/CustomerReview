//
//  ContentView.swift
//  Deers
//
//  Created by Dalal Macbook on 30/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        ZStack{
            Image("background").resizable().scaledToFit().opacity(0.25)

            VStack{
                Spacer()
                Text("How was your experience?").font(.custom("riesling", size: 60))

                HStack{
                    CustomButton(
                               status: "bad",
                               icon: Image("bad")
                           ) {
                               print("bad Clicked!")
                           }
   
                    CustomButton(
                               status: "ok",
                               icon: Image("ok")
                           ) {
                               print("ok Clicked!")
                           }
                    
                    CustomButton(
                               status: "good",
                               icon: Image("good")
                           ) {
                               print("good Clicked!")
                           }
                   
                }
                Spacer()
                
                VStack{
                    Divider()
                    HStack{
                        Image("globe").resizable().frame(width: 32.0, height: 32.0)
                        Text("example.com").font(.custom("riesling", size: 30))
                    }
                    
                    HStack{
                        Image("mail").resizable().frame(width: 32.0, height: 32.0)
                        Text("example.com").font(.custom("riesling", size: 30))
                    }
                    HStack{
                
                    Image("instagram").resizable().frame(width: 32.0, height: 32.0)
                    Text("example.com").font(.custom("riesling", size: 30))
                }
                    HStack{
                Image("twitter").resizable().frame(width: 32.0, height: 32.0)
                Text("example.com").font(.custom("riesling", size: 30))
            }
                }
                
            
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
