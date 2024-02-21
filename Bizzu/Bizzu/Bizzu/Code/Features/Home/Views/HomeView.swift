//
//  HomeView.swift
//  Bizzu
//
//  Created by Ali on 10/12/2023.
//

import Kingfisher
import SwiftUI

struct HomeView: View {
    
    @AppStorage("appColor") private var appColor = AppColor.turuncu.rawValue
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @ObservedObject var homeViewModel = HomeViewModel()
    
    @State private var isShowingWriteQuoteView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing){
                ScrollView {
                    LazyVStack {
                        ForEach(homeViewModel.quotes) { quote in
                            QuotePost(quote: quote)
                        }
                    }
                    .padding(.bottom, 80) 
                }
                
                WriteQuoteButton {
                    self.isShowingWriteQuoteView.toggle()
                }
            }
            .modifier(CustomNavigationBar(title: "Anasayfa"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if let user = authViewModel.currentUser {
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            KFImage(URL(string: user.profileImageURL))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 32, height: 32)
                                .clipShape(Circle())
                        }
                    } else {
                        Circle().fill(.secondary).frame(width: 32, height: 32)
                    }
                }
            }
            .fullScreenCover(isPresented: $isShowingWriteQuoteView, onDismiss: self.homeViewModel.fetchQuotes) {
                WriteQuoteView()
            }
            .refreshable {
                homeViewModel.fetchQuotes()
            }
        }
        .tint(AppColor(rawValue: appColor.lowercased())?.color ?? .orange)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AuthViewModel())
    }
}
