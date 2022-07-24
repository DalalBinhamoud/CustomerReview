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
        ScrollView {
            VStack(alignment: .center){
                
                Spacer()
                Text("كيف كانت تجربتك؟").font(.custom("riesling", size: 60)).foregroundColor(Constants.Colors.secondaryColor)
                
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
                VStack(alignment: .trailing, spacing: 0, content:{
                    Text("الملاحظات").foregroundColor(Constants.Colors.secondaryColor).padding(10)
                    
                    TextEditor(text: $textEditorManager.reviewerInput)
                        .padding(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color(.systemGray5), lineWidth: 1.0)
                        )
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
                        .foregroundColor(Constants.Colors.secondaryColor).padding()
                }).padding([.top, .leading, .trailing],20)
                
                
                // submit btn
                Button(action: {
                    viewModel.addReview(status: self.touchedBtnStatus, note: String(self.textEditorManager.reviewerInput.prefix(Constants.maxLength.textEditor)))
                    self.touchedBtnStatus = ""
                    self.noteCounter = 0
                    self.textEditorManager.reviewerInput = "أضف ملاحظاتك..."
                }) {
                    HStack {
                        Text("إرسال التقييم").font(.custom("riesling", size: 24)).foregroundColor(Constants.Colors.labelColor).padding()
                    }
                }.background(Constants.Colors.secondaryColor).cornerRadius(5).padding()
                
                Spacer()
                
                Divider().foregroundColor(Constants.Colors.primaryColor)
                
                //social media
                HStack{
                    Spacer()
                    
                    ForEach(Constants.fixedLists.socialMediaContent){ content in
                        SocialMediaIcon(iconName: content.icon,name: content.name)
                        Spacer()
                    }
                }.padding(.bottom, 10)
            }
            .background(Constants.Colors.labelColor)
        }
        

    }
}

struct SubmitReviewView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitReviewView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
