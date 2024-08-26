//
//  AlertModel.swift
//  JokeGenerator
//
//  Created by Olga Trofimova on 26.08.2024.
//

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: () -> ()
}
