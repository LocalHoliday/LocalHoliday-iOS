//
//  ModelData.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/03.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var countries: [Country] = Country.defaultCountries
}
