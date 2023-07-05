//
//  ReservationView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/06.
//

import SwiftUI

struct ReservationView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var selected: Int = 0
    private var isSelectedAllJobItems: Bool {
        self.modelData.pickedJobItems.filter { !$0.isSelected }.count == 0
    }
    private var isSelectedAllPlayItems: Bool {
        self.modelData.pickedPlayItems.filter { !$0.isSelected }.count == 0
    }
    var body: some View {
        GeometryReader { proxy in
            VStack {
                HorizontalSelectView(selected: $selected)
                    .frame(maxHeight: Size.XL)
                    .padding()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: Size.M * 2) {
                        if selected == 0 {
                            HStack {
                                Button {
                                    if self.isSelectedAllJobItems {
                                        modelData.deselectAllJobItems()
                                    } else {
                                        modelData.enselectAllJobItems()
                                    }
                                } label: {
                                    if self.isSelectedAllJobItems {
                                        Image(systemName: "checkmark.circle.fill")
                                    } else {
                                        Image(systemName: "checkmark.circle")
                                    }
                                }
                                .animation(.spring(), value: self.isSelectedAllJobItems)
                                .foregroundColor(.Primary)
                                .buttonStyle(.plain)
                                .padding(Size.XS)
                                
                                Group {
                                    Text("전체  ")
                                    + Text("\(self.modelData.pickedJobItems.count)")
                                        .foregroundColor(.Primary)
                                    + Text("개")
                                }
                                .font(.B2M)
                            }
                            ForEach(modelData.pickedJobItems.indices, id: \.self) { index in
                                HStack(alignment: .top) {
                                    Button {
                                        self.modelData.pickedJobItems[index].isSelected.toggle()
                                    } label: {
                                        if self.modelData.pickedJobItems[index].isSelected {
                                            Image(systemName: "checkmark.circle.fill")
                                        } else {
                                            Image(systemName: "checkmark.circle")
                                        }
                                    }
                                    .animation(.spring(), value: self.modelData.pickedJobItems[index].isSelected)
                                    .foregroundColor(.Primary)
                                    .buttonStyle(.plain)
                                    .padding(Size.XS)
                                    JobItemView(jobItem: self.$modelData.pickedJobItems[index], isScrapButtonHidden: true)
                                        .frame(maxHeight: 100)
                                }
                                Divider()
                            }
                        } else {
                            HStack {
                                Button {
                                    if self.isSelectedAllPlayItems {
                                        modelData.deselectAllPlayItems()
                                    } else {
                                        modelData.enselectAllPlayItems()
                                    }
                                } label: {
                                    if self.isSelectedAllPlayItems {
                                        Image(systemName: "checkmark.circle.fill")
                                    } else {
                                        Image(systemName: "checkmark.circle")
                                    }
                                }
                                .animation(.spring(), value: self.isSelectedAllPlayItems)
                                .foregroundColor(.Primary)
                                .buttonStyle(.plain)
                                .padding(Size.XS)
                                
                                Group {
                                    Text("전체  ")
                                    + Text("\(self.modelData.pickedPlayItems.count)")
                                        .foregroundColor(.Primary)
                                    + Text("개")
                                }
                                .font(.B2M)
                            }
                            ForEach(modelData.pickedPlayItems.indices, id: \.self) { index in
                                HStack(alignment: .top) {
                                    Button {
                                        self.modelData.pickedPlayItems[index].isSelected.toggle()
                                    } label: {
                                        if self.modelData.pickedPlayItems[index].isSelected {
                                            Image(systemName: "checkmark.circle.fill")
                                        } else {
                                            Image(systemName: "checkmark.circle")
                                        }
                                    }
                                    .animation(.spring(), value: self.modelData.pickedPlayItems[index].isSelected)
                                    .foregroundColor(.Primary)
                                    .buttonStyle(.plain)
                                    .padding(Size.XS)
                                    PlayItemView(playItem: self.$modelData.pickedPlayItems[index], isScrapButtonHidden: true)
                                        .frame(maxHeight: 100)
                                }
                                Divider()
                            }
                        }
                    }
                    .padding(Size.Inner)
                    .frame(maxWidth: .infinity)
                }
                
                VStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Group {
                            Text("총 ")
                            + Text("\(self.modelData.selectedJobItemCount + self.modelData.selectedPlayItemCount)")
                                .foregroundColor(.Primary)
                            + Text("개 일정")
                        }
                        .font(.H3M)
                        .padding(Size.Inner)
                        .padding(.top, Size.Inner)
                        
                        HStack {
                            Text("로컬알바 ")
                            + Text("\(self.modelData.selectedJobItemCount)")
                                .foregroundColor(.Primary)
                            + Text("개")
                            
                            Text("        로컬 놀거리 ")
                            + Text("\(self.modelData.selectedPlayItemCount)")
                                .foregroundColor(.Primary)
                            + Text("개")
                        }
                        .font(.B1M)
                        .padding(.horizontal, Size.Inner)
                    }
                    Button {
                        print("예약하기 버튼!")
                    } label: {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(maxWidth: proxy.size.width / 5 * 3, maxHeight: 52)
                                .foregroundColor(.Primary)
                                .cornerRadius(Radius.Small)
                            Text("예약하기")
                                .font(.H4B)
                                .foregroundColor(.white)
                        }
                    }
                    .buttonStyle(.plain)
                    .padding(.top, Size.Inner)
                    
                }
                .frame(maxWidth: .infinity)
                .background(
                    .linearGradient(
                        Gradient(colors: [.gray100.opacity(0.6), .white]),
                        startPoint: .top,
                        endPoint: .center
                    )
                )
            }
        }
        .navigationTitle("일정 잡기")
        .navigationBarTitleDisplayMode(.inline)
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
