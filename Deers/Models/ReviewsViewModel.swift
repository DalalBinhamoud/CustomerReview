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
    
    
    func addReview(status: String){
        
//        self.reviewCounter =  UserDefaults.standard.object(forKey: "counter") as! Int
        
        print("counter=\(self.reviewCounter)")
        self.reviewCounter = self.reviewCounter + 1
        UserDefaults.standard.set( (self.reviewCounter), forKey: "counter")
        print("counter=last\(self.reviewCounter)")
        db.collection("collectionName").addDocument(data: ["id": self.reviewCounter, "status": status, "date": Date.now]){ error in
            
            
            if error == nil{
                //no errors
                print("counter=2\(self.reviewCounter)")
                UserDefaults.standard.set( self.reviewCounter, forKey: "counter")
            }else {
                //handle error
            }
            
        }
    }
    
    func fetchData() {
        db.collection("collectionName").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.reviews = documents.map { (queryDocumentSnapshot) -> Review in
                let data = queryDocumentSnapshot.data()
                let status = data["status"] as? String ?? ""
                let id = data["id"] as? String ?? ""
                let date = (data["date"] as? Timestamp)?.dateValue() ?? Date()
                
                print("id=", id)
                print("stat=", status)
                
                //date formater
                let formatter = DateFormatter()
                formatter.dateStyle = .short
              
                //time formatter
                
                let timeFormatter = DateFormatter()
                timeFormatter.timeStyle = .medium
              
                return Review(id: id , status: status, date: formatter.string(from: date), time: timeFormatter.string(from: date))
            }
        }
    }
}
