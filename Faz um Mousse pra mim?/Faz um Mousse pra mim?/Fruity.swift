//
//  Fruity.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 31/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import Foundation

struct Fruity: Decodable{
    let genus: String
    let name: String
    let id: Int
    let family: String
    let order: String
    let nutritions: Nutritions

    enum CodingKeys: String, CodingKey {
        case genus = "genus"
        case name = "name"
        case id = "id"
        case family = "family"
        case order = "order"
        case nutritions = "nutritions"
    }
}

struct Nutritions: Codable {
    let carbohydrates: Double
    let protein: Double
    let fat: Double
    let calories: Int
    let sugar: Double

    enum CodingKeys: String, CodingKey {
        case carbohydrates = "carbohydrates"
        case protein = "protein"
        case fat = "fat"
        case calories = "calories"
        case sugar = "sugar"
    }
}
