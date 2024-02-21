//
//  SettingsView.swift
//  Bizzu
//
//  Created by Ali on 11/12/2023.
//

import StoreKit
import SwiftUI

struct SettingsView: View {
    
    @Environment(\.requestReview) var requestReview
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var displayModeManager: DisplayModeManager
    
    @AppStorage("appColor") private var appColor = AppColor.turuncu.rawValue
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    appColorPicker
                    displayModePicker
                } header: {
                    Text("Görünüm")
                }
                
                Section {
                    aboutRow
                    rateRow
                    
                } header: {
                    Text("Bizzu")
                }
                
                Section {
                    NavigationLink {
                        FeedbackView()
                    } label: {
                        SettingsLabel(settingsOption: .feedback)
                    }

                    
                    linkRow
                } header: {
                    Text("Developer")
                }
                
                Section {
                    moreSectionRows
                } header: {
                    Text("Daha Fazla")
                }
                
                Section {
                    logoutButton
                } header: {
                    Text("Çıkış")
                }
                
                Section {
                    EmptyView()
                } footer: {
                    VStack {
                        Text("Bizzu ile kendinizi ifade etmenin ve başkalarının hikayelerinden ilham almanın keyfini çıkarın. 😊 ")
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.bottom, 80)
                
            }
            .navigationTitle("Ayarlar")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var appColorPicker: some View {
        Picker(selection: $appColor) {
            ForEach(AppColor.allCases, id: \.rawValue) { color in
                Text(color.rawValue.capitalized)
                    .foregroundColor(color.color)
            }
        } label: {
            SettingsLabel(settingsOption: .appColor)
        }
    }
    
    var displayModePicker: some View {
        Picker(selection: displayModeManager.$displayMode) {
            Text("Aydınlık").tag(DisplayMode.light)
            Text("Gece").tag(DisplayMode.dark)
            Text("Sistem").tag(DisplayMode.unspecified)
        } label: {
            SettingsLabel(settingsOption: .displayMode)
        }
    }
    
    var aboutRow: some View {
        NavigationLink {
            AboutView()
        } label: {
            SettingsLabel(settingsOption: .about)
        }
    }
    
    var rateRow: some View {
        HStack {
            Button {
                requestReview()
            } label: {
                SettingsLabel(settingsOption: .rate)
            }
            .tint(.primary)
            
            externalArrowIcon
        }
    }
    
    var linkRow: some View {
        HStack {
            Link(destination: URL(string: "https://www.linkedin.com/in/aliakyildiz44/")!) {
                SettingsLabel(settingsOption: .follow)
            }
            .tint(.primary)
            
            externalArrowIcon
        }
    }
    
    var externalArrowIcon: some View {
        Group {
            Spacer()
            
            Image(systemName: "arrow.up.forward")
                .foregroundColor(Color(UIColor.systemGray3))
                .fontWeight(.medium)
        }
    }
    
    var moreSectionRows: some View {
        Group {
            NavigationLink {
                LoremText(title: .termsOfUse)
            } label: {
                SettingsLabel(settingsOption: .termsOfUse)
            }
            
            NavigationLink {
                LoremText(title: .privacyPolicy)
            } label: {
                SettingsLabel(settingsOption: .privacyPolicy)
            }
        }
    }
    
    var logoutButton: some View {
        Button(role: .destructive) {
            authViewModel.signOut()
        } label: {
            SettingsLabel(settingsOption: .logout)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(AuthViewModel())
            .environmentObject(DisplayModeManager())
    }
}
