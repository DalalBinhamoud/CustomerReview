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
    
    @Environment(\.calendar) var calendar
     @Environment(\.timeZone) var timeZone
     
     var bounds: PartialRangeFrom<Date> {
         let start = calendar.date(
             from: DateComponents(
                 timeZone: timeZone,
                 year: 2022,
                 month: 6,
                 day: 20)
         )!
         
         return start...

     }
     
     @State private var dates: Set<DateComponents> = []
    
    
    var body: some View {
        
        VStack{
            
            HStack(alignment: .center){
            
                
                //end date
                HStack{
                    DatePicker(selection: $endDate, in: startDate...Date(), displayedComponents: .date) {

                    }
                    Text("إلى")
                    
                }.padding([.trailing], -200)
       
                
                //start date
                HStack{
                    
                    DatePicker(selection: $startDate, in: ...endDate, displayedComponents: .date) {
                        
                    }
                    
                    Text("من")
                    
                }
                
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
                Text("رقم التقييم").font(.title)
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

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
