//
//  MyPageView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/06.
//

import SwiftUI

struct MyPageView: View {
    @EnvironmentObject var authData: AuthData
    @State private var showingAlert = false
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
//                NavigationLink {
//                    MyPageEditView()
//                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: Radius.Small)
                            .stroke(Color.gray100)
                        
                        HStack {
                            CircleImageView(imageURL: authData.user.imageURL)
                                .shadow(radius: 5)
                                .padding(Size.Inner)
                            
                            Text(authData.user.nickname)
                                .font(.H4M)
                            
                            Spacer()
                            /*
                            Image(systemName: "chevron.right")
                                .renderingMode(.template)
                                .foregroundColor(.gray300)
                                .padding(.horizontal, Size.Inner)
                             */
                        }
                    }
                    .frame(maxHeight: 100)
                    .padding(Size.Inner)
                    .padding(.vertical, Size.Inner)
//                }
//                .buttonStyle(.plain)
                
                Group {
                    /*
                    NavigationLink {
                        MyPageScrapView()
                    } label: {
                        HStack(spacing: Size.XL) {
                            Image.Scrap
                            Text("스크랩")
                        }
                    }
                    .buttonStyle(.plain)

                    NavigationLink {
                        MyPageCheckScheduleView()
                    } label: {
                        HStack(spacing: Size.XL) {
                            Image.CalendarEdit
                            Text("일정확인")
                        }
                    }
                    .buttonStyle(.plain)

                    NavigationLink {
                        MyPageRecipesView()
                    } label: {
                        HStack(spacing: Size.XL) {
                            Image.Bookmark
                            Text("로컬 홀리데이북")
                        }
                    }
                    .buttonStyle(.plain)
                    */
                    Button {
                        print("로그아웃!!")
                        authData.loginInfo = nil
                    } label: {
                        HStack(spacing: Size.XL) {
                            Image.LogOut
                            Text("로그아웃")
                        }
                    }
                    .buttonStyle(.plain)
                    
                    
                    Button {
                        print("회원 탈퇴!!")
                        showingAlert = true
                    } label: {
                        HStack(spacing: Size.XL) {
                            Image.LogOut
                                .renderingMode(.template)
                                .foregroundColor(.red)
                            Text("회원 탈퇴")
                        }
                    }
                    .buttonStyle(.plain)
                    .alert("정말 탈퇴하시겠습니까?", isPresented: $showingAlert) {
                        Button("취소", role: .cancel) { }
                        Button("탈퇴", role: .destructive) {
                            authData.signOut { _ in
                                authData.loginInfo = nil
                            }
                        }
                    }
                }
                .font(.B2M)
                .padding(Size.Inner)
                .buttonStyle(.plain)
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
