//
//  RegisterView.swift
//  Bizzu
//
//  Created by Ali on 12/12/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var user: UserInputData = UserInputData(email: "", password: "", fullName: "", username: "")
    @State private var profileImage: UIImage?
    
    private var agreementText: some View {
        Text("Kayıt olarak ")
                .foregroundColor(.secondary)
            +
            Text("Kullanım Şartları")
                .foregroundColor(.orange) // Kullanım Şartları metni rengi
                .underline() // Eğer altı çizili olmasını istiyorsanız
            +
            Text(" ve ")
                .foregroundColor(.secondary)
            +
            Text("Gizlilik Politikamızı")
                .foregroundColor(.orange) // Gizlilik Politikamızı metni rengi
                .underline() // Eğer altı çizili olmasını istiyorsanız
            +
            Text(" kabul etmiş olursunuz.")
                .foregroundColor(.secondary)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { _ in
                    
                    RegisterBackButton { dismiss() }
                    
                    ImagePicker { image in
                        profileImage = image
                    }
                    
                    Spacer()
                    
                    OnboardingTitle(screenType: .kayıt)
                    
                    Group {
                        OnboardingTextField(type: .email, text: $user.email)
                        OnboardingTextField(type: .fullName, text: $user.fullName)
                        OnboardingTextField(type: .username, text: $user.username)
                        OnboardingTextField(type: .password, isSecure: true, text: $user.password)
                    }
                    
                    agreementText
                    
                    Spacer()
                    
                    OnboardingSubmitButton(screenType: .kayıt) {
                        authViewModel.register(withUser: user, profileImage: profileImage)
                        dismiss()
                    }
                }
                .scrollIndicators(.hidden)
            }
            .onTapGesture {
                self.hideKeyboard()
            }
            .padding(.horizontal)
            .toolbar(.hidden, for: .navigationBar)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
