//
//  ReviewsView.swift
//  Deers
//
//  Created by Dalal Macbook on 08/07/2022.
//

import SwiftUI
import SwiftUITooltip

struct ReviewsView: View {
    
    @Environment(\.calendar) var calendar
    @ObservedObject private var viewModel = ReviewsViewModel()
    
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    // we have 4 columns
    let columns = [
//        GridItem(.flexible()),
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
        GeometryReader { geometry in
        
        VStack{
         
            HStack(alignment: .center){
            
                
                //end date
                HStack{
                    DatePicker(selection: $endDate, in: startDate...Date(), displayedComponents: .date) {

                    }
                    Text("إلى")
                    
                }.padding([.trailing], geometry.size.width < 500 ? -10: -200)
       
                
                //start date
                HStack{
                    
                    DatePicker(selection: $startDate, in: ...endDate, displayedComponents: .date) {
                        
                    }
                    
                    Text("من")
                    
                }.padding()
                
                Image("calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                
                Spacer()
                
            }
            

            Divider().background(Constants.Colors.primaryColor)
            
            Spacer()
            
            // create custom columns
            LazyVGrid(columns: columns) {
//                Text("رقم التقييم").font(.title)
                Text("حالة التقييم").font(.title)
                Text("التعليقات").font(.title)
                Text("تاريخ التقييم").font(.title)
                Text("وقت التقييم").font(.title)
            }
            
            Divider()
            
            ScrollView {
                
                ForEach(viewModel.reviews) { review in
                    

                    if((startDate...endDate).contains(review.date) || Calendar.current.isDate(startDate, equalTo: review.date, toGranularity: .day))
                    {
                        LazyVGrid(columns: columns, spacing: 4) {
//                            Text(review.id).font(.title)
                            Text(review.status).font(.title)
                            Text(review.note).font(.title).lineLimit(3).multilineTextAlignment(.trailing)
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
