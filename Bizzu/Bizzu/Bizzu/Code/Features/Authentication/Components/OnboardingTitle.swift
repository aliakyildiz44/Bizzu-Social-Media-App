//
//  OnboardingTitle.swift
//  Bizzu
//
//  Created by Ali on 13/12/2023.
//

import SwiftUI

struct OnboardingTitle: View {
    let screenType: OnboardingScreenType
    
    private var title: Text {
        switch screenType {
        case .giriş:
            return Text("Giriş")
        case .kayıt:
            return Text("Kayıt Ol")
        }
    }
    
    var body: some View {
        title.onboardingTitle()
    }
}

extension Text {
    func onboardingTitle() -> some View {
        self
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 24)
    }
}

struct OnboardingTitle_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTitle(screenType: .giriş)
    }
}
