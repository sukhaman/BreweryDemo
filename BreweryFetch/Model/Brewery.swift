//
//  Brewery.swift
//  BreweryFetch
//
//  Created by Sukhaman Singh on 11/18/20.
//

import Foundation

struct Brewery: Decodable, Hashable {
    let name: String
    let state: String
    let city: String
}
