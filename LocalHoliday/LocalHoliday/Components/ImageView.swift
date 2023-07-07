//
//  ImageView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct ImageView: View {
    var imageName: String
    var aspectRatio: CGFloat?
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(aspectRatio, contentMode: .fit)
    }
}

struct CircleImageView: View {
    var image: Image
    var aspectRatio: CGFloat?
    
    init(imageName: String, aspectRatio: CGFloat? = nil) {
        self.image = Image(imageName)
        self.aspectRatio = aspectRatio
    }
    
    init(image: Image) {
        self.image = image
    }
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(aspectRatio, contentMode: .fit)
            .clipShape(Circle())
    }
}

struct SquareImageView: View {
    var imageName: String
    var aspectRatio: CGFloat?

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
        ImageView(imageName: "SampleJobItemImage_wide")
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
