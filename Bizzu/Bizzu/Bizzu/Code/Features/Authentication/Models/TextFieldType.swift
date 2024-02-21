//
//  TextFieldType.swift
//  Bizzu
//
//  Created by Ali on 13/12/2023.
//

import Foundation

enum TextFieldType: String {
    case email
    case password = "Parola"
    case fullName = "İsim"
    case username = "Kullanıcı Adı"
}

extension TextFieldType {
    var icon: String {
        switch self {
        case .email:
            return "envelope"
        case .password:
            return "lock"
        case .fullName:
            return "person"
        case .username:
            return "at"
        }
    }
}
