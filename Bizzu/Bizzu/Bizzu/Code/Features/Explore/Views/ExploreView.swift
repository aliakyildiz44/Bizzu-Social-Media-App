//
//  ExploreView.swift
//  Bizzu
//
//  Created by Ali on 11/12/2023.
//

import SwiftUI

struct ExploreView: View {
    
    @ObservedObject var exploreViewModel = ExploreViewModel()
    
    private var columnGrid = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columnGrid) {
                    if exploreViewModel.searchQuery.isEmpty {
                        ForEach(QuoteCategory.allCases, id: \.rawValue) { category in
                            NavigationLink {
                                CategoryView(category: category)
                            } label: {
                                QuoteCategoryCard(category: category)
                            }

                        }
                    } else {
                        ForEach(exploreViewModel.filteredUsers, id: \.id) { user in
                            NavigationLink {
                                ProfileView(user: user)
                            } label: {
                                ProfileSearchCard(user: user)
                            }
                        }
                    }
                }
                .padding([.top, .horizontal])
                .padding(.bottom, 80)
            }
            .modifier(CustomNavigationBar(title: "Keşfet"))
        }
        .searchable(text: $exploreViewModel.searchQuery, placement: .navigationBarDrawer(displayMode: .always), prompt: "Kullanıcı Ara")
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled(true)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExploreView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
