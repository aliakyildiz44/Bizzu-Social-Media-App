//
//  User.swift
//  Bizzu
//
//  Created by Ali on 15/12/2023.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    
    let email: String
    let username: String
    let profileImageURL: String
    
    var fullName: String
    var favoriteQuote: String
    
    var isCurrentUser: Bool {
        Auth.auth().currentUser?.uid == id
    }
}
