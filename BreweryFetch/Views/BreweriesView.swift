//
//  BreweriesView.swift
//  BreweryFetch
//
//  Created by Sukhaman Singh on 11/18/20.
//

import SwiftUI

struct BreweriesView: View {
    @ObservedObject var viewModel = BreweriesViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.breweries, id: \.self) {
                BreweryView(brewery: $0)
            }.navigationBarTitle("Breweries")
                .onAppear {
                    self.viewModel.fetchBreweries()
            }
        }
    }
}
