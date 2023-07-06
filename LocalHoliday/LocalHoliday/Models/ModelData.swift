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
    
    var selectedJobItem: [JobItem] {
        pickedJobItems.filter { $0.isSelected }
    }
    
    var selectedPlayItem: [PlayItem] {
        pickedPlayItems.filter { $0.isSelected }
    }
    
    var selectedJobItemCount: Int {
        selectedJobItem.count
    }
    
    var selectedPlayItemCount: Int {
        selectedPlayItem.count
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
    
    func deleteSelectedItems() {
        let newJobItems = pickedJobItems.filter { !$0.isSelected }
        let newPlayItems = pickedPlayItems.filter { !$0.isSelected }
        pickedJobItems = newJobItems
        pickedPlayItems = newPlayItems
    }
    
    func addJobItem(_ item: JobItem) {
        if !pickedJobItems.contains(item) {
            pickedJobItems.append(item)
        }
    }
    
    func addPlayItem(_ item: PlayItem) {
        if !pickedPlayItems.contains(item) {
            pickedPlayItems.append(item)
        }
    }
}
