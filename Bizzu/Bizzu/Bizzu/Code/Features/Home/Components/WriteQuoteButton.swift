//
//  WriteQuoteButton.swift
//  Bizzu
//
//  Created by Ali on 13/12/2023.
//

import SwiftUI

struct WriteQuoteButton: View {
    
    @AppStorage("appColor") private var appColor = AppColor.turuncu.rawValue
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "text.bubble.fill")
                .padding()
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .background(AppColor(rawValue: appColor.lowercased())?.color ?? .indigo)
                .clipShape(Circle())
                .padding(.bottom, 80)
                .padding(.trailing)
        }
    }
}

struct WriteQuoteButton_Previews: PreviewProvider {
    static var previews: some View {
        WriteQuoteButton(action: {})
    }
}
