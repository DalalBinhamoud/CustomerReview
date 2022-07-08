//
//  DeersApp.swift
//  Deers
//
//  Created by Dalal Macbook on 30/06/2022.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct DeersApp: App {
    var reviewCounter = 1
    var currentDate = "2022-09-09"

    init() {
        print("test=1")
        FirebaseApp.configure()
        reviewCountConfig()
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-YYYY"
        return formatter.string(from: date)
    }
    
    func reviewCountConfig(){
        let today = Date() // Actual date
        let lastSavedDate = UserDefaults.standard.object(forKey: "currentDate")
        
        // we need to restart counting every new day
        // if currentDate !== today date then we will set today date as currentDate and reset the counter
        
        if(lastSavedDate == nil){
            UserDefaults.standard.set("\(formatDate(date: today))", forKey: "currentDate")
            UserDefaults.standard.set(1, forKey: "counter")
            
        }else if ("\(formatDate(date: today))" == lastSavedDate as! String){
            
            UserDefaults.standard.set("\(formatDate(date: today))", forKey: "currentDate")
            UserDefaults.standard.set(1, forKey: "counter")
        }
    }
    
    
    var body: some Scene {

        WindowGroup {
          
            ContentView()
        }
    }
}
