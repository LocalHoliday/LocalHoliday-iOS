//
//  ImageView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct ImageView: View {
    var id: Int
    var imageName: String
    var aspectRatio: CGFloat?
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(aspectRatio, contentMode: .fit)
            .tag(id)
    }
}

struct CircleImageView: View {
    var id: Int
    var imageName: String
    var aspectRatio: CGFloat?
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(aspectRatio, contentMode: .fit)
            .clipShape(Circle())
            .tag(id)
    }
}

struct SquareImageView: View {
    var id: Int
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
                    .tag(id)
            )
            .clipped()
    }
}

struct RoundedSquareImageView: View {
    var id: Int
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
                    .tag(id)
            )
            .clipped()
            .cornerRadius(radius)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(id: 9, imageName: "SampleJobItemImage_wide")
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(id: 9, imageName: "SampleBookImage")
    }
}

struct SquareImageView_Previews: PreviewProvider {
    static var previews: some View {
        SquareImageView(id: 9, imageName: "SampleJobItemImage_wide")
    }
}

struct RoundedSquareImageView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedSquareImageView(id: 9, imageName: "SampleJobItemImage_wide", radius: Radius.Small)
    }
}
