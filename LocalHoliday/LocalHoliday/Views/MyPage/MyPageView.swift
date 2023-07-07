//
//  MyPageView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/06.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                NavigationLink {
                    MyPageEditView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: Radius.Small)
                            .stroke(Color.gray100)
                        
                        HStack {
                            CircleImageView(id: 0, imageName: "경기")
                                .shadow(radius: 5)
                                .padding(Size.Inner)
                            
                            Text("블랑사랑에디")
                                .font(.H4M)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .renderingMode(.template)
                                .foregroundColor(.gray300)
                                .padding(.horizontal, Size.Inner)
                        }
                    }
                    .frame(maxHeight: 100)
                    .padding(Size.Inner)
                    .padding(.vertical, Size.Inner)
                }
                .buttonStyle(.plain)
                
                Group {
                    NavigationLink {
                        MyPageScrapView()
                    } label: {
                        HStack(spacing: Size.XL) {
                            Image.Scrap
                            Text("스크랩")
                        }
                    }

                    
                    HStack(spacing: Size.XL) {
                        Image.CalendarEdit
                        Text("일정확인")
                    }
                    
                    HStack(spacing: Size.XL) {
                        Image.Bookmark
                        Text("로컬 홀리데이북")
                    }
                    
                    HStack(spacing: Size.XL) {
                        Image.LogOut
                        Text("로그아웃")
                    }
                }
                .font(.B2M)
                .padding(Size.Inner)
            }
        }
        .navigationTitle("내 정보")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyPageView()
        }
    }
}
