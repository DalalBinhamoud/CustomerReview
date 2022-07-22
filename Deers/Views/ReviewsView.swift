//
//  ReviewsView.swift
//  Deers
//
//  Created by Dalal Macbook on 08/07/2022.
//

import SwiftUI

struct ReviewsView: View {
    @ObservedObject private var viewModel = ReviewsViewModel()
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    @State private var isSidebarOpened = false
    
    
    // we have 5 columns
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    func formaterFunc (date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        return formatter.string(from:  date)
        
    }
    
    
    var body: some View {
        ZStack {
            Sidebar(isSidebarVisible: $isSidebarOpened, startDate: $startDate, endDate: $endDate)
            VStack{
           
                
                ZStack {
                    Rectangle().fill(Constants.Colors.primaryColor).frame(width: .infinity, height: 100).ignoresSafeArea()
                    
                    HStack {
                        // make sure the battery is not hidden in real device
                        Image("background-1")
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 100, height: 100).ignoresSafeArea()
                        
                        Spacer()
                                       
                        Button(action: {
                            isSidebarOpened.toggle()
                        }){
                          
                            Text("تاريخ التقييم").foregroundColor(.white)
                            Image("filter-1")
                                           .resizable()
                                           .scaledToFit()
                                           .frame(width: 40, height: 40)
                        }.padding()
                        
                    }
                }
                
                Spacer()
                
                
                // create custom columns
                LazyVGrid(columns: columns) {
                    Text("رقم التقييم").font(.title)
                    Text("حالة التقييم").font(.title)
                    Text("التعليقات").font(.title)
                    Text("تاريخ التقييم").font(.title)
                    Text("وقت التقييم").font(.title)
                }
                
                Divider()
                
                ScrollView {
                    
                    ForEach(viewModel.reviews) { review in
                        
                  
                          if((startDate...endDate).contains(review.date))
                          {
                              LazyVGrid(columns: columns, spacing: 4) {
                                  Text(review.id).font(.title)
                                  Text(review.status).font(.title)
                                  Text(review.note).font(.title).truncationMode(.tail)
                                  Text(formaterFunc(date:review.date)).font(.title)
                                  Text(review.time).font(.title)
                              }.padding(.horizontal)
                              Divider()
                          }
                        
                    }
                }.onAppear(){
                    self.viewModel.fetchData()
                }
            }
        }
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
