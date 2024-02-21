//
//  ProfileView.swift
//  Bizzu
//
//  Created by Ali on 11/12/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var profileViewModel: ProfileViewModel
    
    init(user: User) {
        self.profileViewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeader(viewModel: profileViewModel)
                
                ProfileFilter { currentFilter in
                    profileViewModel.filterQuotes(by: currentFilter)
                }
                
                VStack {
                    ForEach(profileViewModel.quotes) { quote in
                        QuotePost(quote: quote)
                    }
                }
                .padding(.bottom, 80)
                
                Spacer()
            }
        }
        .onAppear(perform: {
            self.profileViewModel.fetchUserQuotes()
            self.profileViewModel.fetchLikedQuotes()
            self.profileViewModel.fetchSavedQuotes()
        })
        .modifier(CustomNavigationBar(title: profileViewModel.user.isCurrentUser ? "Profil" : profileViewModel.user.fullName))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(email: "ali@email.com", username: "aliakyildiz", profileImageURL: "https://developer.apple.com/swift/images/swift-og.png", fullName: "Ali Akyıldız", favoriteQuote: "Öğrenecek daha çok şey var."))
            .environmentObject(AuthViewModel())
    }
}
