//
//  FeedbackView.swift
//  Bizzu
//
//  Created by Ali on 18/12/2023.
//

import SwiftUI

struct FeedbackView: View {
    
    @AppStorage("appColor") private var appColor = AppColor.turuncu.rawValue
    
    @State private var email = ""
    @State private var message = ""
    
    var body: some View {
        Form {
            Section {
                EmptyView()
            } footer: {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Gelişmemize yardımcı olun")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    
                    Text("Soru, öneri, şikayet veya diğer taleplerinizi paylaşabilirsiniz.")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
            }
            
            Section {
                TextField("Email", text: $email, prompt: Text("Email (Opsiyonel)"), axis: .vertical)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
            }
            
            Section {
                TextField("Mesaj", text: $message, prompt: Text("Mesajınız..."), axis: .vertical)
                    .lineLimit(10, reservesSpace: true)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.sentences)
            }
        }
        .onTapGesture {
            self.hideKeyboard()
        }
        .navigationBarTitle("Geribildirim")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // Send Message
                    self.email = ""
                    self.message = ""
                } label: {
                    Image(systemName: SettingsOption.feedback.icon + ".fill")
                }
                .tint(AppColor(rawValue: appColor.lowercased())?.color ?? .indigo)
            }
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedbackView()
        }
    }
}
