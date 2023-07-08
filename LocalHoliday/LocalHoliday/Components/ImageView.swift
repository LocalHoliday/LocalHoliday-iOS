//
//  ImageView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct ImageView: View {
    var imageName: String?
    var aspectRatio: CGFloat?
    var imageURL: String?
    
    var body: some View {
        if let imageURL {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(aspectRatio, contentMode: .fit)
            } placeholder: {
                // 로드 중에 표시할 로딩 화면 또는 이미지
                ProgressView()
            }
        } else {
            Image(imageName ?? "Splash")
                .resizable()
                .aspectRatio(aspectRatio, contentMode: .fit)
            // 추후에 : ProgressView()
        }
    }
}

struct CircleImageView: View {
    var image: Image?
    var aspectRatio: CGFloat?
    var imageURL: String?
    
    init(imageName: String, aspectRatio: CGFloat? = nil) {
        self.image = Image(imageName)
        self.aspectRatio = aspectRatio
    }
    
    init(imageURL: String?, aspectRatio: CGFloat? = nil) {
        self.imageURL = imageURL
        self.aspectRatio = aspectRatio
    }
    
    init(image: Image) {
        self.image = image
    }
    
    var body: some View {
        if let image {
            image
                .resizable()
                .aspectRatio(aspectRatio, contentMode: .fit)
                .clipShape(Circle())
        } else if let imageURL {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(aspectRatio, contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                // 로드 중에 표시할 로딩 화면 또는 이미지
                ProgressView()
            }
        } else {
            Image("Splash")
                .resizable()
                .aspectRatio(aspectRatio, contentMode: .fit)
        }
    }
}

struct SquareImageView: View {
    var imageName: String?
    var aspectRatio: CGFloat?
    var imageURL: String?

    var body: some View {
        if let imageURL {
            Color.clear
                .aspectRatio(1.0, contentMode: .fit)
                .overlay(
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(aspectRatio, contentMode: .fill)
                            .background(Color.gray100)
                    } placeholder: {
                        // 로드 중에 표시할 로딩 화면 또는 이미지
                        ProgressView()
                    }
                )
                .clipped()
        } else {
            Color.clear
                .aspectRatio(1.0, contentMode: .fit)
                .overlay(
                    Image(imageName ?? "Splash")
                        .resizable()
                        .aspectRatio(aspectRatio, contentMode: .fill)
                        .background(Color.gray100)
                )
                .clipped()
        }
    }
}

struct RoundedSquareImageView: View {
    var imageName: String
    var aspectRatio: CGFloat?
    var radius: CGFloat

    var body: some View {
        Color.clear
            .aspectRatio(1.0, contentMode: .fit)
            .overlay(
                Image(imageName)
                    .resizable()
                    .aspectRatio(aspectRatio, contentMode: .fill)
                    .background(Color.gray100)
            )
            .clipped()
            .cornerRadius(radius)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageURL: "http://tong.visitkorea.or.kr/cms/resource/74/2850274_image2_1.jpg")
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(imageName: "SampleBookImage")
    }
}

struct SquareImageView_Previews: PreviewProvider {
    static var previews: some View {
        SquareImageView(imageName: "SampleJobItemImage_wide")
    }
}

struct RoundedSquareImageView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedSquareImageView(imageName: "SampleJobItemImage_wide", radius: Radius.Small)
    }
}
