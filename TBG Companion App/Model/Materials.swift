//
//  Material.swift
//  TBG Companion App
//
//  Created by Dustin Franck on 5/24/23.
//

import Foundation
import Firebase


struct MaterialItem: Identifiable, Codable, Hashable {
    var id: String
    var name: String
    var isRoll: Bool
    var thickness: Double
    var length: Double
    var height: Double
    
    static var emptyMaterial : MaterialItem {
        MaterialItem(id: "", name: "", isRoll: false, thickness: 0.0, length: 0.0, height: 0.0)
    }
}

class Materials: ObservableObject {
    
    let db = Firestore.firestore()
   
    @Published var items = [MaterialItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Materials")
            }
        }
    }
    
    func saveItem2DB(materialItem: MaterialItem) {
        let collectionRef = db.collection("MaterialItem")
               let query = collectionRef.whereField("id", isEqualTo: materialItem.id)
               
               query.getDocuments { (querySnapshot, error) in
                   if let error = error {
                       print("Error checking document existence: \(error)")
                       return
                   }
                   // Check if the document exists
                   if let documents = querySnapshot?.documents, !documents.isEmpty {
                       print("Document with ID \(materialItem.id) already exists in Firestore.")
                   } else {
                       // Document does not exist, proceed to add
                       var ref: DocumentReference? = nil
                       ref = collectionRef.addDocument(data: [
                           "id": materialItem.id,
                           "name": materialItem.name,
                           "isRoll": materialItem.isRoll,
                           "thickness": materialItem.thickness,
                           "length": materialItem.length,
                           "height": materialItem.height,
                       ]) { err in
                           if let err = err {
                               print("Error adding document: \(err)")
                           } else {
                               print("Document added with ID: \(ref!.documentID)")
                           }
                       }
                   }
               }
           }
    
    init() {
        if let savedMaterials = UserDefaults.standard.data(forKey: "Materials") {
            if let decodedMaterials = try? JSONDecoder().decode([MaterialItem].self, from: savedMaterials) {
                items = decodedMaterials
                return
            }
        }
        items = []
    }
}





