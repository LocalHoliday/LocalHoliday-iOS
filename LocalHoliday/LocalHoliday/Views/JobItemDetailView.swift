//
//  JobItemDetailView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct JobItemDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var jobItem: JobItem
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom){
                ScrollView {
                    ZStack(alignment: .topLeading) {
                        VStack(alignment: .leading) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(height: proxy.size.width / 498 * 256)
                                    .background(
                                        ImageView(id: 0, imageName: "SampleJobItemImage_wide")
                                            .aspectRatio(contentMode: .fill)
                                            .frame(height: proxy.size.width / 498 * 256)
                                            .clipped()
                                    )
                            }
                            .clipped()
                            VStack(alignment: .leading, spacing: Size.S) {
                                Text(jobItem.title)
                                    .font(.H2SB)
                                LocationComponent(location: jobItem.location, font: .B2M)
                                    .font(.B2M)
                                
                                Text("작업기간   ")
                                    .font(.B2M)
                                    .foregroundColor(.black)
                                + Text("\(jobItem.startTime) ~ \(jobItem.endTime)")
                                    .font(.B2M)
                                    .foregroundColor(.gray500)
                                
                                Text("급여   ")
                                    .font(.B2M)
                                    .foregroundColor(.black)
                                + Text(jobItem.salary == nil ? "협의" : "\(jobItem.salary!)")
                                    .font(.B2M)
                                    .foregroundColor(.tertiary)
                                
                                Text("담당자   ")
                                    .font(.B2M)
                                    .foregroundColor(.black)
                                + Text(jobItem.manager)
                                    .font(.B2M)
                                
                                Text("전화번호   ")
                                    .font(.B2M)
                                    .foregroundColor(.black)
                                + Text(jobItem.phoneNumber)
                                    .font(.B2M)
                            }
                            .padding(Size.Inner)
                            
                            Rectangle()
                                .frame(maxWidth: .infinity, maxHeight: Size.XS)
                                .foregroundColor(.gray100)
                        }
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .contentShape(Rectangle())
                                .padding()
                        }
                    }
                }
                HStack {
                    ScrapButton(isScrapped: $jobItem.isScrapped)
                    Button {
                        print("일정에 추가하기 버튼")
                    } label: {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(maxWidth: proxy.size.width, maxHeight: 52)
                                .foregroundColor(.Primary)
                                .cornerRadius(Radius.Small)
                            Text("일정에 추가하기")
                                .font(.H4B)
                                .foregroundColor(.white)
                        }
                    }
                    .buttonStyle(.plain)
                }
                .padding(Size.M)
            }
        }
        .navigationTitle("")
        .toolbar(.hidden)
    }
}

struct JobItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        JobItemDetailView(jobItem: .constant(.default))
    }
}
