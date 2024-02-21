//
//  LoremText.swift
//  Bizzu
//
//  Created by Ali on 18/12/2023.
//

import SwiftUI

struct LoremText: View {
    
    let title: SettingsOption
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Text(AboutBizzu.lorem)
                .padding()
                .padding(.bottom, 80)
        }
        .navigationTitle(title.rawValue.capitalized)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LoremText_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoremText(title: .termsOfUse)
        }
    }
}
