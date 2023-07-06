//
//  MyPageEditView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/06.
//

import SwiftUI

struct MyPageEditView: View {
    @EnvironmentObject var authData: AuthData
    @State private var postedImage: Image? = .경기
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: Size.Inner) {
                HStack {
                    PhotosPickerView(postedImage: $postedImage) {
                        ZStack {
                            CircleImageView(id: 0, image: postedImage ?? .defaultUser)
                                .frame(width: Size.XXXXL)
                                .shadow(radius: 5)
                            
                            Circle()
                                .fill(.white)
                                .frame(width: Size.L)
                                .shadow(radius: 5)
                                .overlay {
                                    Image(systemName: "camera")
                                            .renderingMode(Image.TemplateRenderingMode.original)
                                            .imageScale(.small)
                                            .foregroundColor(.black)
                                }
                                .offset(x: Size.XXL - Size.S, y: +Size.XXL - Size.S)
                        }
                    }
                    
                    Text("블랑사랑에디")
                        .font(.H4M)
                        .padding(Size.Inner)
                }
                .padding(Size.Inner)
                
                Rectangle()
                    .fill(Color.gray100)
                    .frame(height: Size.XS)
                
                VStack(alignment: .leading, spacing: Size.Inner) {
                    HStack {
                        Text("회원 정보")
                            .font(.H4M)
                        Spacer()
                        Button {
                            print("수정")
                        } label: {
                            Text("수정")
                                .font(.B1M)
                        }
                    }
                    
                    Text("이름")
                        .font(.B1M)
                    
                    VStack {
                        TextField("이름을 적어주세요", text: self.$authData.user.name)
                            .font(.B2M)
                        Divider()
                    }
                }
                .padding(Size.Inner)
                
                
            }
        }
        .navigationTitle("내 정보 수정")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton(color: .black, padding: 0)
            }
        }
    }
}

struct MyPageEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyPageEditView()
                .environmentObject(AuthData())
        }
    }
}
