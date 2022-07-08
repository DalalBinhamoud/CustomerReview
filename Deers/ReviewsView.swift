//
//  ReviewsView.swift
//  Deers
//
//  Created by Dalal Macbook on 08/07/2022.
//

import SwiftUI

struct ReviewsView: View {
    @ObservedObject private var viewModel = ReviewsViewModel()
    
    var body: some View {
        
        ScrollView {

            ForEach(viewModel.reviews) { review in
                                VStack{
                                    HStack{
                                        Text(review.status).font(.title)
                                        Text(review.id).font(.title)
                                        Text(review.date).font(.title)
                                        Text(review.time).font(.title)
                                    }
                                    Divider()
                                }
               }
            
        }.onAppear(){
            self.viewModel.fetchData()
        }
     
        
        
        
        

    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
    }
}
