//
//  ReviewsView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/03.
//

import SwiftUI

struct ReviewsView: View {
    @Binding var reviews: [Review]
    @Binding var item: JobOrPlayItem
    var body: some View {
        VStack(alignment: .leading, spacing: Size.Inner) {
            HStack(alignment: .lastTextBaseline) {
                Text("후기")
                    .font(.H3B)
                
                Spacer()
                
                NavigationLink {
                    ReviewWritingView(item: item)
                } label: {
                    Text("후기 작성하기")
                        .font(.B1R)
                        .foregroundColor(.Primary)
                }
                .buttonStyle(.plain)
            }
            .padding(.bottom, Size.Inner)
            ForEach(reviews, id: \.id) { review in
                VStack(alignment: .leading, spacing: Size.Inner) {
                    HStack {
                        CircleImageView(imageName: "경기")
                            .frame(maxHeight: Size.XXL)
                        Text(review.user.nickname)
                            .font(.B2M)
                    }
                    ImageView(imageName: "SampleReviewImage")
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
        NavigationStack {
            ScrollView {
                ReviewsView(reviews: .constant(Review.defaultReviews), item: .constant(.jobItem(.default)))
            }
        }
    }
}
