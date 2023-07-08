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
    @Published var scrappedJobItems: [JobItem] = []
    @Published var scrappedPlayItems: [PlayItem] = []
    var token: String?
    
    init(token: String? = nil) {
        self.token = token
    }
    
    private let repository = DefaultMainRepository()
    
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
    
    convenience init(scrappedJobItems: [JobItem], scrappedPlayItems: [PlayItem]) {
        self.init()
        self.scrappedJobItems = scrappedJobItems
        self.scrappedPlayItems = scrappedPlayItems
        
        for i in 0..<self.scrappedJobItems.count {
            self.scrappedJobItems[i].isScrapped = true
        }
        
        for i in 0..<self.scrappedPlayItems.count {
            self.scrappedPlayItems[i].isScrapped = true
        }
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
    
    func scrapJobItem(_ item: JobItem) {
        if !scrappedJobItems.contains(item) {
            scrappedJobItems.append(item)
        }
    }
    
    func scrapPlayItem(_ item: PlayItem) {
        if !scrappedPlayItems.contains(item) {
            scrappedPlayItems.append(item)
        }
    }
    
    func unscrapJobItem(_ item: JobItem) {
        if let index = scrappedJobItems.firstIndex(of: item) {
            scrappedJobItems.removeFirst(index)
        }
    }
    
    func unscrapPlayItem(_ item: PlayItem) {
        print("before unscrap : \(scrappedPlayItems)")
        print("item : \(item)")
        print("item == scrapped[0] => \(item == scrappedPlayItems[0])")
        if let index = scrappedPlayItems.firstIndex(of: item) {
            scrappedPlayItems.remove(at: index)
        }
        print("after unscrap : \(scrappedPlayItems)")
    }
    
    func isContained(_ item: JobItem) -> Bool {
        scrappedJobItems.contains(item)
    }
    
    func isContained(_ item: PlayItem) -> Bool {
        scrappedPlayItems.contains(item)
    }
}

extension ModelData {
    // MARK: - UseCase
    public func getPlayItems(
        _ location: String,
        onNext: (([PlayItem]) -> Void)? = nil,
        onError: (() -> Void)? = nil,
        onCompletion: (() -> Void)? = nil
    ) {
        self.repository.getPlayItems(location, token: self.token)
            .prefix(1)
            .sink { completion in
                defer {
                    onCompletion?()
                }
                switch completion {
                case .failure(let error):
                    print("error! : \(error.localizedDescription)")
                    onError?()
                case.finished:
                    print("finished!")
                }
            } receiveValue: { result in
                print("result : \(result)")
                let playItems: [PlayItem] = [
                    result.result?.foodDTOList.compactMap { PlayItem.fromDTO($0) },
                    result.result?.houseDTOList.compactMap { PlayItem.fromDTO($0) },
                    result.result?.tourDTOList.compactMap { PlayItem.fromDTO($0) }
                ].compactMap { $0 }
                .flatMap { $0 }
                
                onNext?(playItems)
            }
            .store(in: &self.repository.cancellables)
    }
    
}
