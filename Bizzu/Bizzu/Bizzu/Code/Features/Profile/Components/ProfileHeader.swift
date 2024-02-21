//
//  ProfileHeader.swift
//  Bizzu
//
//  Created by Ali on 11/12/2023.
//

import Kingfisher
import SwiftUI

struct ProfileHeader: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var profileViewModel: ProfileViewModel
    
    @State private var isEditMode = false
    @State private var editedFullName = ""
    @State private var editedFavoriteQuote = ""
    
    init(viewModel: ProfileViewModel) {
        self.profileViewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: profileViewModel.user.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                VStack(alignment: .leading){
                    if !isEditMode {
                        Text(profileViewModel.user.fullName)
                            .font(.headline)
                    } else {
                        TextField("Ad Soyad", text: $editedFullName, axis: .horizontal)
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.words)
                            .autocorrectionDisabled(true)
                    }
                    
                    Text("@\(profileViewModel.user.username)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                if !profileViewModel.user.isCurrentUser {
                    Menu {
                        Button(role: .destructive) {
                            // TODO: Report User
                        } label: {
                            Label("Bildir", systemImage: "exclamationmark.bubble")
                        }

                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    .contentShape(Rectangle())
                }

            }
            
            if !isEditMode {
                if !profileViewModel.user.favoriteQuote.isEmpty {
                    Text("\"\(profileViewModel.user.favoriteQuote)\"")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .padding(.vertical, 8)
                }
            } else {
                TextField("Favori paylaşım", text: $editedFavoriteQuote, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.sentences)
                    .autocorrectionDisabled(true)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .padding(.vertical, 8)
            }
            
            if profileViewModel.user.isCurrentUser {
                Button {
                    if self.isEditMode {
                        profileViewModel.updateFullName(newName: editedFullName)
                        profileViewModel.updateFavoriteQuote(newQuote: editedFavoriteQuote)
                        self.clearEditFields()
                    } else {
                        self.editedFullName = profileViewModel.user.fullName
                        self.editedFavoriteQuote = profileViewModel.user.favoriteQuote
                    }
                    
                    self.isEditMode.toggle()
                } label: {
                    Text(self.isEditMode ? "Kaydet" : "Profili Düzenle")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .light ? Color(UIColor.systemGray6) : Color(UIColor.systemGray4))
                        .tint(.secondary)
                        .cornerRadius(12)
                        .padding(.vertical, 8)
                }
            }

        }
        .padding()
        .background(colorScheme == .light ? .white : Color(UIColor.systemGray5))
        .cornerRadius(20)
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
    
    private func clearEditFields() {
        self.editedFullName = ""
        self.editedFavoriteQuote = ""
    }
}

/*
fileprivate struct NumberCard: View {
    
    let number: String
    let title: String
    
    var body: some View {
        NavigationLink {
            Text("\(number) \(title)!")
        } label: {
            VStack {
                Text(number)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .tint(.primary)
                
                Text(title)
                    .font(.caption2)
                    .tint(.secondary)
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color(UIColor.systemGray4))
            .cornerRadius(12)
        }

    }
}
*/

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader(viewModel: ProfileViewModel(user: User(email: "ali@email.com", username: "aliakyildiz", profileImageURL: "https://developer.apple.com/swift/images/swift-og.png", fullName: "Ali Akyıldız", favoriteQuote: "Öğrenecek daha çok şey var.")))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemGray6), ignoresSafeAreaEdges: .all)
    }
}
