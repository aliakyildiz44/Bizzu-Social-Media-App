//
//  OnboardingSubmitButton.swift
//  Bizzu
//
//  Created by Ali on 13/12/2023.
//

import SwiftUI

struct OnboardingSubmitButton: View {
    
    
    
    let screenType: OnboardingScreenType
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(screenType.rawValue.capitalized)
                .padding()
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color(UIColor.systemGray6))
        }
        .background(.orange)
        .cornerRadius(12)
        .padding(.vertical)

    }
}

struct OnboardingSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSubmitButton(screenType: .giriş, action: {})
    }
}
