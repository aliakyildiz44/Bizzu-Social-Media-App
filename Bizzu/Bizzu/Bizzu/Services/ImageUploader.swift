//
//  ImageUploader.swift
//  Bizzu
//
//  Created by Ali on 14/12/2023.
//

import FirebaseStorage
import UIKit

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let reference = Storage.storage().reference(withPath: "/profileImages/\(filename)")
        
        reference.putData(imageData) { _, error in
            if let error {
                print("DEBUG: Profil resmi yükleme başarısız!, \(error)")
                return
            }
            
            reference.downloadURL { imageURL, error in
                if let error {
                    print("DEBUG: Kullanıcı resminin indirme linki alınamadı, \(error)")
                    return
                }
                
                guard let imageURL = imageURL?.absoluteString else { return }
                completion(imageURL)
                print("DEBUG: Profil resmi yükleme başarılı.")
            }
        }
    }
    
}
