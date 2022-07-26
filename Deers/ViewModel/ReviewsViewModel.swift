//
//  ReviewsViewModel.swift
//  Deers
//
//  Created by Dalal Macbook on 08/07/2022.
//

import Foundation
import FirebaseFirestore


class ReviewsViewModel: ObservableObject {
    
    @Published var reviews = [Review]()
    var reviewCounter =  UserDefaults.standard.object(forKey: "counter") as! Int
    
    private var db = Firestore.firestore()
    
    
    func addReview(status: String, note: String){
        
//        self.reviewCounter =  UserDefaults.standard.object(forKey: "counter") as! Int
        
        self.reviewCounter = self.reviewCounter + 1
        UserDefaults.standard.set( (self.reviewCounter), forKey: "counter")
        db.collection("Review").addDocument(data: ["id": self.reviewCounter, "status": status, "date": Date.now, "notes": note]){ error in
            
            
            if error == nil{
                //no errors
                UserDefaults.standard.set( self.reviewCounter, forKey: "counter")
            }else {
                //handle error
            }
            
        }
    }
    
    func fetchData() {
        db.collection("Review").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            var counter = 1
            
           
            
            self.reviews = documents.map { (queryDocumentSnapshot) -> Review in
                let data = queryDocumentSnapshot.data()
                let status = data["status"] as? String ?? ""
                let note = data["notes"] as? String ?? ""
                let id = counter
                let date = (data["date"] as? Timestamp)?.dateValue() ?? Date()
                
                counter = counter + 1
                
                //time formatter
                let timeFormatter = DateFormatter()
                timeFormatter.timeStyle = .short
              
                return Review(id: "\(id)" , status: status, date: date, time: timeFormatter.string(from: date), note: note)
            }
        }
    }
}
