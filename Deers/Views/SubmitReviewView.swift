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
    @ObservedObject private var textEditorManager = TextEditorManager()
    @State private var noteCounter: Int = 0
    @State private var touchedBtnStatus: String = " "
    
    // const
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
                        icon: Image(touchedBtnStatus == btn.status ? "\(btn.status)-1": btn.status)
                    ) {
                        self.touchedBtnStatus = btn.status
                    }
                    Spacer()
                }
                
            }
            Spacer()
            
            // note
            VStack(alignment: .trailing, spacing: -40, content:{
                Text("الملاحظات").foregroundColor(Constants.Colors.labelColor)
                
                TextEditor(text: $textEditorManager.reviewerInput)
                
                    .padding([.top, .bottom, .leading], 50)
                    .lineSpacing(5)
                    .lineLimit(Constants.maxLength.textLines)
                    .multilineTextAlignment(.trailing)
                
                    .foregroundColor(textEditorManager.reviewerInput == placeholderTxt ? .gray : .primary)
                    .onChange(of: textEditorManager.reviewerInput){ (value) in
                        self.noteCounter = self.textEditorManager.reviewerInput.count
                    }
                    .onTapGesture {
                        // we remove the placeholder when user start typing
                        if self.textEditorManager.reviewerInput == placeholderTxt {
                            self.textEditorManager.reviewerInput = ""
                        }
                    }
                Text(noteCounter <= 1 ? "\(self.noteCounter) /\(Constants.maxLength.textEditor)" : "\(noteCounter) /\(Constants.maxLength.textEditor)")
                    .foregroundColor(Constants.Colors.labelColor)
            }).padding(.trailing, 50)
            
            Spacer()
            
            // submit btn
            Button(action: {
                viewModel.addReview(status: self.touchedBtnStatus, note: String(self.textEditorManager.reviewerInput.prefix(Constants.maxLength.textEditor)))
                self.touchedBtnStatus = ""
                self.noteCounter = 0
                self.textEditorManager.reviewerInput = "أضف ملاحظاتك..."
            }) {
                HStack {
                    Text("إرسال التقييم").padding(10)
                }
            }.background(Constants.Colors.labelColor).cornerRadius(5)
            
            Divider().foregroundColor(Constants.Colors.labelColor)
            
            //social media
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
