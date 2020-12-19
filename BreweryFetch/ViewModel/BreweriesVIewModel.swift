//
//  BreweryViewModel.swift
//  BreweryFetch
//
//  Created by Sukhaman Singh on 11/18/20.
//

import SwiftUI
import Combine

class BreweriesViewModel: ObservableObject {
    private let url = "https://api.openbrewerydb.org/breweries"
    private var task: AnyCancellable?
    
    @Published var breweries: [Brewery] = []
    
    func fetchBreweries() {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: [Brewery].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \BreweriesViewModel.breweries, on: self)
    }
}
