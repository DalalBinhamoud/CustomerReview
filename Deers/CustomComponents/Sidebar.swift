//
//  Sidebar.swift
//  Deers
//
//  Created by Dalal Macbook on 22/07/2022.
//

import SwiftUI

struct Sidebar: View {
    @Binding var isSidebarVisible: Bool
    @Binding var startDate: Date
    @Binding var endDate : Date
    
    var sideBarWidth = UIScreen.main.bounds.size.width * 0.3
    var bgColor: Color =
    Color(.init(gray: 10, alpha: 1))
    
    var secondaryColor: Color =
    Color(.init(
        red: 100 / 255,
        green: 174 / 255,
        blue: 255 / 255,
        alpha: 1))
    
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(isSidebarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSidebarVisible)
            .onTapGesture {
                isSidebarVisible.toggle()
            }
            content
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                bgColor
                // MenuChevron
                
                
                VStack(alignment: .leading, spacing: 20) {
                    ReviewsRangePicker
                }.padding(.top, 100)
                    .padding(.horizontal, 60)
                
                
                
                
            }
            .frame(width: sideBarWidth)
            .offset(x: isSidebarVisible ? 0 : -sideBarWidth)
            .animation(.default, value: isSidebarVisible)
            
            Spacer()
        }
    }
    
    var MenuChevron: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(bgColor)
                .frame(width: 60, height: 60)
                .rotationEffect(Angle(degrees: 45))
                .offset(x: isSidebarVisible ? -18 : -10)
                .onTapGesture {
                    isSidebarVisible.toggle()
                }
            
            Image(systemName: "chevron.right")
                .foregroundColor(secondaryColor)
                .rotationEffect(
                    isSidebarVisible ?
                    Angle(degrees: 180) : Angle(degrees: 0))
                .offset(x: isSidebarVisible ? -4 : 8)
                .foregroundColor(.blue)
        }
        .offset(x: sideBarWidth / 2, y: 80)
        .animation(.default, value: isSidebarVisible)
    }
    
    var ReviewsRangePicker: some View {
        VStack{
            Spacer()
            Text("تاريخ التقييم").font(.custom("riesling", size: 40))
            
            
            //start date
            HStack{
                
                DatePicker(selection: $startDate, in: ...endDate, displayedComponents: .date) {
                    
                }.background(Color.gray)
                
                Text("من")
                
            }
            
            //end date
            HStack{
                DatePicker(selection: $endDate, in: startDate...Date(), displayedComponents: .date) {

                }.background(Color.gray)
                Text("إلى")
                
            }
            Spacer()
            
        }
        
    }
}
