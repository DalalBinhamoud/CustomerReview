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
    @State private var noteCounter: Int = 0
    @State private var note: String = "أضف ملاحظاتك..."
    private let placeholderTxt = "أضف ملاحظاتك..."

    var body: some View {
        
        VStack(alignment: .center){
            // logo
            HStack {
                Image("background-1").resizable().scaledToFill().scaledToFit().padding(5)
                Spacer()
            }
            Spacer()
            Text("كيف كانت تجربتك؟").font(.custom("riesling", size: 60)).foregroundColor(Constants.Colors.labelColor)
            
            // status btns
            HStack{
                Spacer()
                ForEach(Constants.fixedLists.btnStatus) { btn in
                    CustomButton(
                        
                        status: btn.status,
                        icon: Image("\(btn.status)-1")
                    ) {
                        
                        viewModel.addReview(status: btn.status)
                        print("\(btn.status) Clicked!")
                    }
                    Spacer()
                }
                
            }
            Spacer()
            
            
            // note
            VStack(alignment: .trailing, spacing: -40, content:{
                Text("الملاحظات").foregroundColor(Constants.Colors.labelColor)
                
                TextEditor(text: $note)
                    .padding([.top, .bottom, .leading], 50)
                    .lineSpacing(5)
                    .multilineTextAlignment(.trailing)
                
                    .foregroundColor(note == placeholderTxt ? .gray : .primary)
                    .onChange(of: note){ (value) in
                        print(self.note)
                        let words = self.note.split { $0 == " " || $0.isNewline }
                        self.noteCounter = words.count
                    }
                    .onTapGesture {
                        // we remove the placeholder when user start typing
                        if note == placeholderTxt {
                            note = ""
                        }
                    }
                Text(noteCounter <= 1 ? "\(noteCounter) /\(Constants.maxLength.textEditor)" : "\(noteCounter) /\(Constants.maxLength.textEditor)")
                    .foregroundColor(Constants.Colors.labelColor)
            }).padding(.trailing, 50)
            
            Spacer()
            
            Button(action: {
                print("hii")
            }) { /// call the closure here
                HStack {
                    Text("إرسال التقييم").padding(10)
                }
            
            }.background(Constants.Colors.labelColor).cornerRadius(5)
            
            
            Divider().foregroundColor(Constants.Colors.labelColor)
            
            
            HStack{
                Spacer()
                
                ForEach(Constants.fixedLists.socialMediaContent){ content in
                    SocialMediaIcon(iconName: content.icon,name: content.name)
                    Spacer()
                }
            }.padding(.bottom, 20)
        }
        .background(Constants.Colors.secondaryColor)
    }
}

struct SubmitReviewView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitReviewView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
