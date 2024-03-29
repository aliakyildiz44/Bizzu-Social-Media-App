//
//  CustomNavigationBar.swift
//  Bizzu
//
//  Created by Ali on 11/12/2023.
//

import SwiftUI

struct CustomNavigationBar: ViewModifier {
    
    let title: String
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(UIColor.systemGray6), ignoresSafeAreaEdges: .all)
            .safeAreaInset(edge: .top) {
                Color.clear
                    .frame(height: 0)
                    .background(.bar)
                    .border(.black)
            }
    }
}
