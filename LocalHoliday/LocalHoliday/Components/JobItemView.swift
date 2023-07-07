//
//  JobItemView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/02.
//

import SwiftUI

struct JobItemView: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var jobItem: JobItem
    var isScrapButtonHidden = false
    var body: some View {
        HStack(alignment: .center, spacing: Size.M * 2) {
            ImageView(id: jobItem.id, imageName: "경기")
            
            VStack(alignment: .leading, spacing: Size.XS) {
                HStack {
                    Text(jobItem.title)
                        .font(.B1M)
                        .padding(.vertical, Size.XS)
                    Spacer()
                }
                LocationComponent(location: jobItem.location)
                Text("작업기간 ")
                    .font(.B3M)
                    .foregroundColor(.black)
                + Text("\(jobItem.startTime) ~ \(jobItem.endTime)")
                    .font(.B3M)
                    .foregroundColor(.gray500)
                
                Text("급여 ")
                    .font(.B3M)
                    .foregroundColor(.black)
                + Text(jobItem.salary == nil ? "협의" : "\(jobItem.salary!)")
                    .font(.B3M)
                    .foregroundColor(.tertiary)
            }
            .frame(maxWidth: .infinity)
            
            if !isScrapButtonHidden {
                ScrapButton(isScrapped: $jobItem.isScrapped)
                    .onChange(of: jobItem.isScrapped) { newValue in
                        if newValue {
                            modelData.scrapJobItem(jobItem)
                        } else {
                            modelData.unscrapJobItem(jobItem)
                        }
                    }
            }
        }
    }
}

struct JobItemView_Previews: PreviewProvider {
    static var previews: some View {
        JobItemView(jobItem: .constant(.default))
            .environmentObject(ModelData())
    }
}
