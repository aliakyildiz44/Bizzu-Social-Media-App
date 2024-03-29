//
//  View+Extensions.swift
//  Bizzu
//
//  Created by Ali on 25.12.2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ aligment: Alignment = .center) -> some View {
        self.frame(maxWidth: .infinity, alignment: aligment)
    }
    
    @ViewBuilder
    func vSpacing(_ aligment: Alignment = .center) -> some View {
        self.frame(maxHeight: .infinity, alignment: aligment)
    }
    
    @ViewBuilder
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.5 : 1)
    }
}
