//
//  userFirebase.swift
//  ImageRecognition
//
//  Created by javon maxwell on 2022-04-10.
//

import UIKit
import Firebase
import FirebaseFirestore

extension SearchItem {
    static func build(from documents: [QueryDocumentSnapshot]) -> [SearchItem] {
        var users = [SearchItem]()
        for document in documents {
            users.append(SearchItem(name: document["name"] as? String ?? "",
                              about: document["about"] as? String ?? ""))
        }
        return users
    }
}
