//
//  BookView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/01.
//

import SwiftUI

struct BookView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageView(imageName: "SampleBookImage", aspectRatio: 1/1.618)
            
            VStack(alignment: .leading) {
                Text("두근두근 전주에서의 로컬 홀리데이")
                    .font(.H4B)
                    .foregroundColor(.white)
                    .padding(.horizontal, Size.Inner)
                
                HStack {
                    Image(systemName: "person")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                    Text("블랑사랑에디")
                        .font(.B4R)
                        .foregroundColor(.white)
                }
                .padding(.all, Size.Inner)
            }
        }
        .background(Color.gray100)
        .cornerRadius(Radius.Small)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
            .frame(width: 187, height: 293)
    }
}
