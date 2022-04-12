//
//  userService.swift
//  ImageRecognition
//
//  Created by javon maxwell on 2022-04-10.
//

import UIKit
import Firebase
import FirebaseFirestore

class UserService {
    let database = Firestore.firestore()

    func get(collectionID: String, handler: @escaping ([SearchItem]) -> Void) {
        database.collection("AnimalFinder")
            .addSnapshotListener { querySnapshot, err in
                if let error = err {
                    print(error)
                    handler([])
                } else {
                    handler(SearchItem.build(from: querySnapshot?.documents ?? []))
                }
            }
    }
}
