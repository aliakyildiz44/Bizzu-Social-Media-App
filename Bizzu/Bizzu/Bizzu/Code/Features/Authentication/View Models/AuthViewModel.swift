//
//  AuthViewModel.swift
//  Bizzu
//
//  Created by Ali on 14/12/2023.
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    private let userService = UserService()
    
    init() {
        self.userSession =  Auth.auth().currentUser
        self.fetchUser()
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        userService.fetchUser(uid: uid) { user in
            self.currentUser = user
        }
    }
    
   func login(withUser user: UserInputData) {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { result, error in
            if let error {
                print("DEBUG: Giriş başarısız!, \(error)")
                return
            }
            
            guard let loggedInUser = result?.user else { return }
            
            self.userSession = loggedInUser
            self.fetchUser()
            
            print("DEBUG: Giriş başarılı :), \(String(describing: self.userSession?.uid)).")
        }
    }
    
   /* func login(withUser user: UserInputData) {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { result, error in
            if let error = error {
                print("DEBUG: Giriş başarısız!, \(error)")
                self.showAlert(message: "Giriş başarısız! \(error.localizedDescription)")
                return
            }
            
            guard let loggedInUser = result?.user else { return }
            
            self.userSession = loggedInUser
            self.fetchUser()
            
            print("DEBUG: Giriş başarılı :), \(String(describing: self.userSession?.uid)).")
        }
    } */

   /* func showAlert(message: String) {
            let alertController = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            NotificationCenter.default.post(name: Notification.Name("ShowAlertNotification"), object: nil, userInfo: ["alert": alertController])
        } */
    
    
    
    
    
    func register(withUser user: UserInputData, profileImage: UIImage?) {
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result, error in
            if let error {
                print("DEBUG: Kayıt başarısız!, \(error)")
                return
            }
            
            
            guard let registeredUser = result?.user else { return }
            
            self.userSession = registeredUser
            print("DEBUG: Kayıt başarılı :), \(String(describing: self.userSession?.uid)).")
            
            guard let profileImage else {
                print("DEBUG: Kullanıcı profil resmi bulunamadı!")
                return
            }
            
            
            ImageUploader.uploadImage(image: profileImage) { userImageURL in
                let userData = [
                    "email": user.email,
                    "username": user.username.lowercased(),
                    "fullName": user.fullName,
                    "favoriteQuote": "",
                    "profileImageURL": userImageURL
                ]
                
                Firestore.firestore().collection("users").document(registeredUser.uid).setData(userData) { _ in
                    print("DEBUG: Kullanıcı verileri başarıyla güncellendi :), \(userData).")
                }
                
                self.fetchUser()
            }
        }
    }
    
    func resetPassword(forEmail email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }
    
    func signOut() {
        self.userSession = nil
        self.currentUser = nil
        try? Auth.auth().signOut()
    }
}
