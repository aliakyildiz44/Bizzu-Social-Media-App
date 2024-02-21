//
//  HomeViewModel.swift
//  Bizzu
//
//  Created by Ali on 16/12/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var quotes: [Quote] = []
    
    let quoteService = QuoteService()
    let userService = UserService()
    
    init() {
        fetchQuotes()
    }
    
    func fetchQuotes() {
        quoteService.fetchQuotes { fetchedQuotes in
            self.quotes = fetchedQuotes
            
            for index in 0 ..< fetchedQuotes.count {
                let uid = fetchedQuotes[index].uid
                
                self.userService.fetchUser(uid: uid) { user in
                    self.quotes[index].user = user
                }
            }
        }
    }
}
