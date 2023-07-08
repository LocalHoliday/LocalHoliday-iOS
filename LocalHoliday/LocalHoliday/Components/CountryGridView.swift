//
//  CountryGridView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/06/30.
//

import SwiftUI

struct CountryGridView: View {
    @Binding var countries: [Country]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: Size.Inner) {
            ForEach(countries) { country in
                NavigationLink(value: country) {
                    IconView(image: Image(country.title), title: country.title)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, Size.Inner / 2)
        }
        .padding(.horizontal, Size.Inner / 2)
        .navigationDestination(for: Country.self) { country in
            CountryDetailView(country: country)
        }
    }
}

struct CountryGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CountryGridView(countries: .constant(Country.defaultCountries))
        }
    }
}
