//
//  LoginView.swift
//  Bizzu
//
//  Created by Ali on 12/12/2023.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var user: UserInputData = UserInputData(email: "", password: "")
    @State private var isSecure: Bool = true
    
    @FocusState private var isTextFieldFocused: Bool
    
    @State private var isForgotPasswordSheetPresented: Bool = false

    
    var forgotPasswordButton: some View {
        Button("Şifremi Unuttum") {
            
            // Forgot Password Action
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .foregroundColor(.orange)
        .fontWeight(.bold)
    }
    
    var body: some View {
        NavigationView {
            ScrollViewReader { _ in
                OnboardingImage(screenType: .giriş)
                OnboardingTitle(screenType: .giriş)
                
                OnboardingTextField(type: .email, text: $user.email)
                OnboardingTextField(type: .password, isSecure: true, text: $user.password)
                
                forgotPasswordButton
                
                Spacer()
                
                OnboardingSubmitButton(screenType: .giriş) {
                    authViewModel.login(withUser: user)
                    dismiss()

                }
                
                HStack {
                    Text("Hesabınız yok mu?")
                        .foregroundColor(.secondary)
                    
                    NavigationLink(destination: RegisterView()) {
                 
                        Text("Kayıt Ol")
                            .foregroundColor(.orange)
                            .fontWeight(.bold)
                        
                    }
                }
                
            }
            .onTapGesture {
                self.hideKeyboard()
            }
            .scrollIndicators(.hidden)
            .scrollDisabled(!isTextFieldFocused)
            .padding(.horizontal)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
