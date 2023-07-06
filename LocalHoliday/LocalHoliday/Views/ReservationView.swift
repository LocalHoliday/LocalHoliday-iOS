//
//  ReservationView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/06.
//

import SwiftUI

struct ReservationView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var modelData: ModelData
    @State private var reservedJobItems: [JobItem] = JobItem.defaultJobItems
    @State private var reservedPlayItems: [PlayItem] = PlayItem.defaultPlayItems
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var isAgreed: Bool = false
    @State private var isAlertPresented = false
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: Size.Inner) {
                        Group {
                            Text("로컬 홀리데이 ")
                                .foregroundColor(.Primary)
                            + Text("기본 정보")
                        }
                        .font(.H3SB)
                        .padding(.vertical, Size.Inner)
                        
                        Group {
                            Text("이름   ")
                                .font(.B3R)
                            + Text("이정민")
                                .font(.H3M)
                            Text("전화번호   ")
                                .font(.B3R)
                            + Text("010 - 1234 - 1234")
                                .font(.H3M)
                            Text("사는 곳   ")
                                .font(.B3R)
                            + Text("서울시 동작구 상도로")
                                .font(.H3M)
                            Text("로컬 홀리데이 기간을 입력해주세요.")
                                .font(.B3R)
                                .padding(.top, Size.Inner)
                            HStack {
                                DatePicker("가는 날", selection: $startDate, displayedComponents: .date)
                                    .padding(.horizontal, Size.Inner)
                                    .font(.B3R)
                                DatePicker("오는 날", selection: $endDate, displayedComponents: .date)
                                    .padding(.horizontal, Size.Inner)
                                    .font(.B3R)
                            }
                        }
                        
                        Divider()
                        
                        Group {
                            Text("로컬 알바")
                                .foregroundColor(.Primary)
                            + Text(" 확인")
                        }
                        .font(.H3SB)
                        
                        ForEach(modelData.pickedJobItems.indices, id: \.self) { index in
                            JobItemView(jobItem: self.$modelData.pickedJobItems[index], isScrapButtonHidden: true)
                                .frame(maxHeight: 100)
                            Divider()
                        }
                        
                        VStack(alignment: .leading, spacing: Size.Inner) {
                            Group {
                                Text("로컬 놀거리")
                                    .foregroundColor(.Primary)
                                + Text(" 확인")
                            }
                            .font(.H3SB)
                            
                            ForEach(modelData.pickedPlayItems.indices, id: \.self) { index in
                                PlayItemView(playItem: self.$modelData.pickedPlayItems[index], isScrapButtonHidden: true)
                                    .frame(maxHeight: 100)
                                Divider()
                            }
                            
                            Divider()
                            
                            Text("예약 시 주의사항")
                                .font(.H4M)
                            
                            Group {
                                Text("로컬 알바는 신청 이후로 절대 취소가 되지 않는 점을 유의해 주세요.\n")
                                + Text("중복으로 알바 일정을 잡지 않도록 유의해주세요.\n")
                                + Text("본 로컬 홀리데이 서비스는 중개 서비스만 제공하며 그 이외의 것에서 소비자에게 발생한 잘못에 대해서는 책임을 지지 않습니다.")
                            }
                            .font(.B3R)
                            .foregroundColor(.gray300)
                        }
                        
                        HStack {
                            Spacer()
                            Button {
                                self.isAgreed.toggle()
                            } label: {
                                HStack {
                                    if self.isAgreed {
                                        Image(systemName: "checkmark.square.fill")
                                            .renderingMode(.template)
                                            .foregroundColor(.Primary)
                                    } else {
                                        Image(systemName: "checkmark.square")
                                            .renderingMode(.template)
                                            .foregroundColor(.gray300)
                                        
                                    }
                                    Text("주의사항을 확인했습니다.")
                                        .font(.B2M)
                                        .foregroundColor(self.isAgreed ? .Primary : .gray300)
                                }
                            }
                            .contentShape(Rectangle())
                            
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                self.modelData.deleteSelectedItems()
                                self.isAlertPresented.toggle()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: Radius.Small)
                                        .fill(Color.Primary)
                                        .frame(width: proxy.size.width / 5 * 3, height: 60)
                                    Text("예약하기")
                                        .font(.H4B)
                                        .foregroundColor(.white)
                                }
                            }
                            .buttonStyle(.plain)
                            .disabled(!self.isAgreed)
                            
                            Spacer()
                        }
                    }
                    .padding(Size.Inner)
                }
            }
            .overlay {
                if self.isAlertPresented {
                    ZStack {
                        Color.black
                            .opacity(0.5)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: proxy.size.width, height: proxy.size.height)
                        
                        RoundedRectangle(cornerRadius: Radius.Small)
                            .fill(.white)
                            .frame(width: proxy.size.width / 9 * 8, height: proxy.size.height / 4 * 3)
                        
                        
                        ZStack(alignment: .topTrailing) {
                            VStack {
                                Image.CheckmarkFilled
                                
                                Text("예약이 완료되었습니다")
                                
                                HStack {
                                    Image.Time
                                    
                                    Text("2023.06.30 ~ 2023.07.04")
                                        .font(.B3R)
                                        .foregroundColor(.gray500)
                                    
                                    Text("4박 5일")
                                        .font(.B3R)
                                        .foregroundColor(.tertiary)
                                }
                                .padding(.bottom, Size.Inner)
                                
                                ScrollView {
                                    VStack {
                                        ForEach(self.reservedJobItems.indices, id: \.self) { index in
                                            JobItemView(jobItem: self.$reservedJobItems[index], isScrapButtonHidden: true)
                                                .frame(maxHeight: 100)
                                            Divider()
                                        }
                                        
                                        ForEach(self.reservedPlayItems.indices, id: \.self) { index in
                                            PlayItemView(playItem: self.$reservedPlayItems[index], isScrapButtonHidden: true)
                                                .frame(maxHeight: 100)
                                            Divider()
                                        }
                                    }
                                }
                            }
                            
                            Button {
                                self.dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .renderingMode(.template)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(Size.Inner)
                        .frame(width: proxy.size.width / 9 * 8, height: proxy.size.height / 4 * 3)
                    }
                    .padding(Size.XS)
                }
            }
        }
        .navigationTitle("예약하기")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton(color: .black, padding: 0)
            }
        }
        
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReservationView()
                .environmentObject(ModelData(pickedJobItems: JobItem.defaultJobItems, pickedPlayItems: PlayItem.defaultPlayItems))
        }
    }
}
