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
        VStack{
            
            HStack{
            
                //end date
                DatePicker(selection: $endDate, in: startDate...Date(), displayedComponents: .date) {
                }.background(Color.red).fixedSize().frame(maxWidth: .infinity, alignment: .trailing)
                Text("إلى")
                
                //start date
                DatePicker(selection: $startDate, in: ...endDate, displayedComponents: .date) {
                    
                }.background(Color.blue).fixedSize().frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("من")
                
                Text("التاريخ:").font(.custom("riesling", size: 30))
                
                
            }
            
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
                              Text(review.note).font(.title)
                              Text(formaterFunc(date:review.date)).font(.title)
                              Text(review.time).font(.title)
                          }.padding(.horizontal)
                          Divider()
                      }
                    
                }
            }.onAppear(){
//                self.viewModel.fetchData()
            }
        }
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
    }
}
