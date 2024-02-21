//
//  ImagePicker.swift
//  Bizzu
//
//  Created by Ali on 14/12/2023.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    
    var action: (UIImage) -> Void
    
    var body: some View {
        PhotosPicker(selection: $selectedItem) {
            Group {
                if let selectedImage {
                    Image(uiImage: selectedImage)
                        .onboardingImage()
                        .clipShape(Circle())
                } else {
                    Image(systemName: "camera.circle.fill")
                        .onboardingImage()
                        .tint(.orange)
                }
            }
            .frame(width: 180, height: 180)
        }
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    selectedImage = UIImage(data: data)
                    action(selectedImage!)
                }
            }
        }
        
    }
}

extension Image {
    func onboardingProfileImage() -> some View {
        self
            .resizable()
            .scaledToFill()
    }
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker(action: { _ in })
    }
}
