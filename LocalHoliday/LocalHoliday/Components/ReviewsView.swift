//
//  ReviewsView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/03.
//

import SwiftUI

struct ReviewsView: View {
    @Binding var reviews: [Review]
    var body: some View {
        VStack(alignment: .leading, spacing: Size.Inner) {
            Text("후기")
                .font(.H3B)
                .padding(.bottom, Size.Inner)
            ForEach(reviews, id: \.id) { review in
                VStack(alignment: .leading, spacing: Size.Inner) {
                    HStack {
                        CircleImageView(id: review.user.id, imageName: "경기")
                            .frame(maxHeight: Size.XXL)
                        Text(review.user.nickname)
                            .font(.B2M)
                    }
                    ImageView(id: review.id, imageName: "SampleReviewImage")
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight: Size.ImageMaxHeight)
                        .clipped()
                        .cornerRadius(Radius.Small)
                    
                    Text(review.body)
                        .font(.B2R)
                        .padding(.horizontal, Size.XS)
                    
                    Text(review.date)
                        .font(.B4M)
                        .padding(.horizontal, Size.XS)
                        .padding(.bottom, Size.XS)
                }
            }
        }
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            ReviewsView(reviews: .constant(Review.defaultReviews))
        }
    }
}
