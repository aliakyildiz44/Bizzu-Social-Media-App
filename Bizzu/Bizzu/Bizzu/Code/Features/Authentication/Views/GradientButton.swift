//
//  GradientButton.swift
//  Bizzu
//
//  Created by Ali on 25.12.2023.
//

import SwiftUI

struct GradientButton: View {
    var title: String
    var icon: String
    var onClick: () -> ()
    var body: some View {
        Button(action: onClick, label: {
            HStack(spacing: 15) {
                Text(title)
                Image(systemName: icon)
            }
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 35)
            .background(.linearGradient(colors: [Color.yellow, .orange, .red], startPoint: .top, endPoint: .bottom), in: .capsule)
        })
    }
}


