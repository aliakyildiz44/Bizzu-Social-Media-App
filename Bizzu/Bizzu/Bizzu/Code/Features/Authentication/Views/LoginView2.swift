//
//  LoginView2.swift
//  Bizzu
//
//  Created by Ali on 25.12.2023.
//

import SwiftUI

struct LoginView2: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15, content: {
            Spacer(minLength: 0)
            
            Text("Giriş")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Devam etmek için giriş yapın")
                .font(.caption)
                .foregroundStyle(.gray)
                .foregroundColor(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                CustomTF(sfIcon: "at", hint: "Email", value: $email)
                
                CustomTF(sfIcon: "lock", hint: "Şifre", isPassword: true, value: $password)
                    .padding(.top, 5)
                
                Button("Şifremi Unuttum") {
                    
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.yellow)
                .hSpacing(.trailing)
                
                //Login Button
                GradientButton(title: "Giriş", icon: "arrow.right") {
                    
                }
                .hSpacing(.trailing)
                
                .disableWithOpacity(email.isEmpty || password.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6) {
                Text("Hala hesabınız yok mu?")
                    .foregroundStyle(.gray
                    )
                Button("Kayıt Ol") {
                    
                }
                .fontWeight(.bold)
                .tint(.yellow)
            }
            .font(.callout)
            .hSpacing()
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
        
        
    }
    
   
}

struct LoginView2_Previews: PreviewProvider {
    static var previews: some View {
        LoginView2()
    }
}

