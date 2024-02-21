//
//  AboutView.swift
//  Bizzu
//
//  Created by Ali on 18/12/2023.
//

import SwiftUI

struct AboutView: View {
    
    @AppStorage("appColor") private var appColor = AppColor.turuncu.rawValue
    
    var body: some View {
        Form {
            ForEach(AboutBizzu.about, id: \.self) { item in
                Section {
                    DisclosureGroup {
                        Text(item.answer)
                    } label: {
                        Text(item.question)
                    }
                    .tint(AppColor(rawValue: appColor.lowercased())?.color ?? .indigo)
                }
            }
            
            // Fixing Layout issues with custom toolbar
            Section { EmptyView() } footer: {
                Text("").padding(.bottom, 80)
            }
        }
        .navigationTitle("Hakkımızda")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
