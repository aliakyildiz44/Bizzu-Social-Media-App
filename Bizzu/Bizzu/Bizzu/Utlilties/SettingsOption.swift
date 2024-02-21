//
//  SettingsOption.swift
//  Bizzu
//
//  Created by Ali on 18/12/2023.
//

import Foundation

enum SettingsOption: String {
    case appColor = "Tema"
    case displayMode = "Ekran Modu"
    
    case about = "Hakkımızda"
    case rate = "Değerlendir"
    
    case feedback = "Geribildirim"
    case follow = "Takip"
    
    case termsOfUse = "Kullanım Koşulları"
    case privacyPolicy = "Gizlilik Politikası"
    
    case logout = "Çıkış"
}

extension SettingsOption {
    var icon: String {
        switch self {
        case .appColor:
            return "circle.hexagongrid"
        case .displayMode:
            return "circle.lefthalf.filled"
        case .about:
            return "info.circle"
        case .rate:
            return "star"
        case .feedback:
            return "paperplane"
        case .follow:
            return "at"
        case .termsOfUse:
            return "doc"
        case .privacyPolicy:
            return "lock"
        case .logout:
            return "rectangle.portrait.and.arrow.forward"
        }
    }
}
