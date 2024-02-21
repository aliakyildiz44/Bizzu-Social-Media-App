//
//  SettingsLabel.swift
//  Bizzu
//
//  Created by Ali on 18/12/2023.
//

import SwiftUI

struct SettingsLabel: View {
    
    @AppStorage("appColor") private var appColor = AppColor.turuncu.rawValue
    
    let settingsOption: SettingsOption
    
    var body: some View {
        HStack {
            Image(systemName: settingsOption.icon)
                .fontWeight(.medium)
                .foregroundColor(settingsOption == .logout ? .red : AppColor(rawValue: appColor.lowercased())?.color ?? .orange)
            
            Text(settingsOption.rawValue.capitalized)
        }
    }
}

struct SettingsLabel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabel(settingsOption: .appColor)
    }
}
