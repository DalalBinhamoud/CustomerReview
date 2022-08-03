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
    @State private var touchedBtnStatus: String = ""
    @State private var showErrorMsg: Bool = false
    
    
    var body: some View {
        
        VStack{
            
            Spacer()
                 
            ScrollView {
                
                Text("كيف كانت تجربتك؟").font(.custom("riesling", size: 50)).foregroundColor(Constants.Colors.primaryColor)
                    .padding([.top], 20)
                
                // status btns
                HStack(alignment: .center){
                    ForEach(Constants.fixedLists.btnStatus) { btn in
                        CustomButton(

                            status: btn.status,
                            icon: Image(touchedBtnStatus == btn.status || touchedBtnStatus == "" ?  btn.status: "\(btn.status)-1")
                        )
                        {
                            self.touchedBtnStatus = btn.status
                        }.frame(maxHeight: 200)
                    }
                    
                }
                
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
                    
                        .foregroundColor( .primary)
                        .onChange(of: textEditorManager.reviewerInput){ (value) in
                            self.noteCounter = self.textEditorManager.reviewerInput.count
                        }
                    Text(noteCounter <= 1 ? "\(self.noteCounter) /\(Constants.maxLength.textEditor)" : "\(noteCounter) /\(Constants.maxLength.textEditor)")
                        .foregroundColor(Constants.Colors.secondaryColor).padding()
                }).padding([.leading, .trailing],20).padding([.top], 0)
                
                // submit btn
                VStack{
                    
                    
                    Button(action: {
                        if (self.touchedBtnStatus != ""){
                            
                            viewModel.addReview(status: self.touchedBtnStatus, note: String(self.textEditorManager.reviewerInput.prefix(Constants.maxLength.textEditor)))
                            self.touchedBtnStatus = ""
                            self.noteCounter = 0
                            self.textEditorManager.reviewerInput = ""
                            self.showErrorMsg = false
                            
                        } else{
                            self.showErrorMsg = true
                        }
                        
                    }) {
                        HStack {
                            Text("إرسال التقييم").font(.custom("riesling", size: 24)).foregroundColor(Constants.Colors.labelColor).padding()
                        }
                    }.background(Constants.Colors.secondaryColor).cornerRadius(5).padding()
                    Text(self.showErrorMsg ? "الرجاء تحديد حالة تجربتك" : "").foregroundColor(.red).padding()
                    
                }.padding([.bottom],self.showErrorMsg ? 0 : -50)
                
            }// end of scrollable view

            VStack{
                
                Divider().foregroundColor(Constants.Colors.primaryColor)
                //social media
                HStack{
                    Spacer()
                    
                    ForEach(Constants.fixedLists.socialMediaContent){ content in
                        SocialMediaIcon(iconName: content.icon,name: content.name)
                        Spacer()
                    }
                }.padding(.bottom, 10).background(Constants.Colors.labelColor)
            }
        }
    }
}

struct SubmitReviewView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitReviewView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
