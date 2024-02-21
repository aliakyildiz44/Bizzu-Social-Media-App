//
//  ResetPassword.swift
//  Bizzu
//
//  Created by Ali on 25.12.2023.
//

import SwiftUI
import FirebaseAuth

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var resetPasswordError: Error?

    var body: some View {
        
      
        
        VStack {
            TextField("E-posta Adresi", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Şifremi Sıfırla") {
                resetPassword(forEmail: email)
            }
            .padding()
        }
        .padding()
       
    }

    private func resetPassword(forEmail email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                resetPasswordError = error
            } else {
                // Şifre sıfırlama başarılı olduysa kullanıcıyı bilgilendirme veya başka bir işlem yapabilirsiniz.
                print("Şifre sıfırlama e-postası gönderildi.")
            }
        }
    }
}

