//
//  AppColor.swift
//  Bizzu
//
//  Created by Ali on 17/12/2023.
//

import SwiftUI

enum AppColor: String, CaseIterable {
    
    case kırmızı, turuncu, yeşil, nane , teal, cyan, mavi, indigo, mor, pembe, kahverengi, siyah

}

extension AppColor {
    var color: Color {
        switch self {
        case .kırmızı:
            return .red
        case .turuncu:
            return .orange
        case .yeşil:
            return .green
        case .nane:
            return .mint
        case .teal:
            return .teal
        case .cyan:
            return .cyan
        case .mavi:
            return .blue
        case .indigo:
            return .indigo
        case .mor:
            return .purple
        case .pembe:
            return .pink
        case .kahverengi:
            return .brown
        case .siyah:
            return .primary
        }
    }
}
