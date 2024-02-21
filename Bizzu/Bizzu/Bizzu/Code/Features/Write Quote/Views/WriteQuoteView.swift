//
//  WriteQuoteView.swift
//  Bizzu
//
//  Created by Ali on 12/12/2023.
//

import SwiftUI

struct WriteQuoteView: View {
    
    @AppStorage("appColor") private var appColor = AppColor.turuncu.rawValue
    
    @Environment(\.dismiss) var dismiss
    
    @State private var quote: String = ""
    @State private var author: String = ""
    @State private var quoteCategory: QuoteCategory = .sanat
    
    private let quoteService = QuoteService()
    
    private var authorTextField: some View {
        HStack {
            Image(systemName: "pencil.circle.fill")
                .font(.footnote)
                .fontWeight(.semibold)
            
            TextField("Yazar", text: $author)
                .textInputAutocapitalization(.words)
        }
    }
    
    private var quoteTextField: some View {
        HStack {
            QuoteIcon(iconType: .opening)
            
            TextField("Paylaşım", text: $quote, axis: .vertical)
                .textInputAutocapitalization(.sentences)
            
            QuoteIcon(iconType: .closing)
        }
    }
    
    var quoteCategoryPicker: some View {
        Picker("Kategori", selection: $quoteCategory) {
            ForEach(QuoteCategory.allCases, id: \.self) { category in
                Text(category.icon + " " + category.rawValue.capitalized)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    quoteTextField
                    authorTextField
                }
                .autocorrectionDisabled(true)
                .listRowSeparator(.hidden)
                
                Section {
                    quoteCategoryPicker
                }
            }
            .onTapGesture {
                self.hideKeyboard()
            }
            .navigationTitle("Gönderi Ekle")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Geri") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Paylaş") {
                        quoteService.uploadQuote(quote: quote, author: author, category: quoteCategory)
                        dismiss()
                    }
                    .font(.headline)
                }
            }
            .tint(AppColor(rawValue: appColor.lowercased())?.color ?? .indigo)
        }
    }
}

struct WriteQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteQuoteView()
    }
}
