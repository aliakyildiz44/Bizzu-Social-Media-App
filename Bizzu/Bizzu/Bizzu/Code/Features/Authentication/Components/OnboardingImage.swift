//
//  OnboardingImage.swift
//  Bizzu
//
//  Created by Ali on 13/12/2023.
//

import SwiftUI


struct OnboardingImage: View {
    
    
    
    let screenType: OnboardingScreenType
    
    private var image: Image {
        switch screenType {
        case .giriş:
            return Image("Login")
        case .kayıt:
            return Image("Register")
        }
    }
    
    var body: some View {
        image.onboardingImage()
    }
}

extension Image {
    func onboardingImage() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
}

struct OnboardingImage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingImage(screenType: .giriş)
    }
}
