//
//  ReviewWritingView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/04.
//

import SwiftUI
import PhotosUI

struct ReviewWritingView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var modelData: ModelData
    @State private var reviewBody: String = ""
    @State private var postedImage: Image? = nil
    var item: JobOrPlayItem
    var targetUUID: String {
        switch item {
        case .jobItem(let jobItem):
            return jobItem.id
        case .playItem(let playItem):
            return playItem.id
        }
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Size.Inner) {
                RoundedRectangle(cornerRadius: Radius.Small)
                    .stroke(Color.gray100, lineWidth: Size.XXS)
                    .frame(height: 140)
                    .overlay {
                        Group {
                            switch item {
                            case .jobItem(let item):
                                JobItemViewWithoutBinding(jobItem: item)
                            case .playItem(let item):
                                PlayItemViewWithoutBinding(playItem: item)
                            }
                        }
                        .padding(Size.M)
                    }
                    .cornerRadius(Radius.Small)
                    .padding(.vertical, Size.M)
                
                Text("관광지의 후기를 남겨주세요")
                    .font(.B1M)
                    .padding(.top, Size.Inner)
                
                TextEditor(text: $reviewBody)
                    .padding()
                    .multilineTextAlignment(.leading)
                    .font(.B2M)
                    .lineSpacing(Size.XS)
                
                    .frame(minHeight: 185)
                    .overlay {
                        RoundedRectangle(cornerRadius: Radius.Small)
                            .inset(by: 0.5)
                            .stroke(Color.gray100)
                    }
                
                Text("관광지의 이미지를 등록해주세요")
                    .font(.B1M)
                    .padding(.top, Size.Inner)
                
                if let postedImage {
                    postedImage
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fill)
                        .overlay {
                            Button {
                                self.postedImage = nil
                            } label: {
                                Image(systemName: "minus.circle.fill")
                                    .renderingMode(Image.TemplateRenderingMode.original)
                                    .imageScale(.large)
                            }
                            .offset(x: Size.XXXXXL - Size.XS, y: -Size.XXXXXL + Size.XS)
                        }
                        .frame(width: Size.XXXXXL * 2, height: Size.XXXXXL * 2)
                } else {
                    PhotosPickerView(postedImage: $postedImage) {
                        RoundedRectangle(cornerRadius: Radius.Small)
                            .frame(width: Size.XXXXXL, height: Size.XXXXXL)
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
                
                Button {
                    print("등록하기")
                    modelData.postReview(targetUUID: targetUUID, content: reviewBody, image: postedImage, onNext: {
                        dismiss()
                    })
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: Radius.Small)
                            .stroke(Color.Primary, lineWidth: Size.XXS)
                        Text("등록하기")
                            .font(.H4R)
                            .padding(Size.Inner)
                            .foregroundColor(.Primary)
                    }
                }
                .padding(.top, Size.Inner)
            }
            .padding(Size.Inner)
        }
        .navigationTitle("후기 작성하기")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton(color: .black, padding: 0)
            }
        }
        .tapToHideKeyboard()
    }
}

struct ReviewWritingView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewWritingView(item: JobOrPlayItem.jobItem(.default))
    }
}
