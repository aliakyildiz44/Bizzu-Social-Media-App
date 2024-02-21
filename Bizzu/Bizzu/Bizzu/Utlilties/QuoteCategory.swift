//
//  QuoteCategory.swift
//  Bizzu
//
//  Created by Ali on 11/12/2023.
//

import Foundation

enum QuoteCategory: String, CaseIterable {
    
    
    case sanat
    case güzellik
    case üniversite
    case vefat
    case depresyon
    case evlilik
    case İbadet
    case fitness
    case komik
    case problem
    case gelecek
    case sağlık
    case hüzün
    case liderlik
    case aşk
    case erkek
    case para
    case motivasyon
    case araba
    case üretkenlik
    case ilişki
    case yalnızlık
    case uyku
    case çalışma
    case başarı
    case ipuçları
    case kadın
    
    var description: String {
        "Bu kategorinin ne olduğunun \(self.rawValue.capitalized) bir açıklamasıdır."
    }
    
}

extension QuoteCategory {
    var icon: String {
        switch self {
            
        
            
        case .sanat:
            return "🎨"
            
        case .güzellik:
            return "🌸"
            
        case .üniversite:
            return "🎓"
            
        case .vefat:
            return "🪦"
            
        case .depresyon:
            return "🌧️"
            
        case .evlilik:
            return "💍"
            
        case .İbadet:
            return "🕌"
            
        case .fitness:
            return "👟"
            
        case .komik:
            return "😂"
            
        case .problem:
            return "🚬"
            
        case .gelecek:
            return "🔮"
            
        case .sağlık:
            return "🫀"
            
        case .hüzün:
            return "💔"
            
        case .liderlik:
            return "🧑‍✈️"
            
        case .aşk:
            return "💌"
            
        
        case .erkek:
            return "🚹"
            
        case .para:
            return "💰"
            
        case .motivasyon:
            return "🔥"
            
        case .araba:
            return "🚗"
            
        case .üretkenlik:
            return "🏗️"
            
        case .ilişki:
            return "👥"
            
        case .yalnızlık:
            return "👤"
            
        case .uyku:
            return "🛏️"
            
        case .çalışma:
            return "📚"
            
        case .başarı:
            return "🏅"
            
        case .ipuçları:
            return "💡"
            
        case .kadın:
            return "🚺"
        }
    }
}
