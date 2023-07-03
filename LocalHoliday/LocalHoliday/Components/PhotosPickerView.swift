//
//  PhotosPickerView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/04.
//

import SwiftUI
import PhotosUI
import CoreTransferable

struct PhotosPickerView<Body: View>: View {
    @Binding var postedImage: Image?
    
    @State private var imageSelection: PhotosPickerItem? = nil
    
    
    /// view를 누르면 PhotosPicker가 실행됨.
    @ViewBuilder var view: Body
    
    var body: some View {
        PhotosPicker(selection: $imageSelection,
                     matching: .images,
                     photoLibrary: .shared()) {
            self.view
        }
        .buttonStyle(.borderless)
        .onChange(of: imageSelection) { newValue in
            Task {
                if let data = try? await newValue?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        self.postedImage = Image(uiImage: uiImage)
                    }
                }
            }
        }
    }
}



struct PhotosPickerView_Previews: PreviewProvider {
    private struct PhotosPickerTestView: View {
        @State private var postedImage: Image? = nil
        var body: some View {
            VStack {
                if let postedImage {
                    postedImage
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fill)
                        .overlay {
                            Button {
                                self.postedImage = nil
                            } label: {
                                Image(systemName: "minus.circle.fill")
                                    .renderingMode(.original)
                                    .imageScale(.large)
                            }
                            .offset(x: Size.XXXXL - Size.XS, y: -Size.XXXXL + Size.XS)
                        }
                        .frame(width: Size.XXXXL * 2, height: Size.XXXXL * 2)
                } else {
                    PhotosPickerView(postedImage: $postedImage) {
                        RoundedRectangle(cornerRadius: Radius.Small)
                            .frame(width: Size.XXXXL, height: Size.XXXXL)
                            .foregroundColor(.gray100)
                            .overlay {
                                Image(systemName: "plus")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(.black)
                                    .aspectRatio(1.0, contentMode: .fit)
                                    .frame(maxWidth: Size.XL)
                            }
                    }
                }
            }
        }
    }
    static var previews: some View {
        PhotosPickerTestView()
    }
}
