//
//  Model.swift
//  Countries
//
//  Created by İbrahim Bayram on 9.02.2023.
//

import Foundation

struct Country :Decodable {
    let name : String
    let capital : String
    let region : String
}
