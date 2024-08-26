//
//  JokeModel.swift
//  JokeGenerator
//
//  Created by Olga Trofimova on 22.08.2024.
//

import Foundation

struct JokeModel: Decodable {
    let type: String
    let setup: String
    let punchline: String
    let id: Int
}
