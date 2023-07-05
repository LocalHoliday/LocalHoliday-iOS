//
//  ModelData.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/03.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var countries: [Country] = Country.defaultCountries
    @Published var pickedJobItems: [JobItem] = []
    @Published var pickedPlayItems: [PlayItem] = []
    
    var selectedJobItemCount: Int {
        pickedJobItems.filter { $0.isSelected }.count
    }
    
    var selectedPlayItemCount: Int {
        pickedPlayItems.filter { $0.isSelected }.count
    }
    
    convenience init(pickedJobItems: [JobItem], pickedPlayItems: [PlayItem]) {
        self.init()
        self.pickedJobItems = pickedJobItems
        self.pickedPlayItems = pickedPlayItems
    }
    
    func deselectAllJobItems() {
        for index in 0..<pickedJobItems.count {
            pickedJobItems[index].isSelected = false
        }
    }
    
    func deselectAllPlayItems() {
        for index in 0..<pickedPlayItems.count {
            pickedPlayItems[index].isSelected = false
        }
    }
    
    func enselectAllJobItems() {
        for index in 0..<pickedJobItems.count {
            pickedJobItems[index].isSelected = true
        }
    }
    
    func enselectAllPlayItems() {
        for index in 0..<pickedPlayItems.count {
            pickedPlayItems[index].isSelected = true
        }
    }
}
