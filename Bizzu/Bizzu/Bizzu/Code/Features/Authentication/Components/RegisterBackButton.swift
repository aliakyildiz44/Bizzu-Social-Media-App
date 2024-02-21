//
//  RegisterBackButton.swift
//  Bizzu
//
//  Created by Ali on 13/12/2023.
//

import SwiftUI

struct RegisterBackButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "arrow.left.circle.fill")
                .font(.title)
                .tint(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
        }
    }
}

struct RegisterBackButton_Previews: PreviewProvider {
    static var previews: some View {
        RegisterBackButton(action: {})
    }
}
