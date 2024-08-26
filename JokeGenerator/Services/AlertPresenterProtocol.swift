//
//  AlertPresenterProtocol.swift
//  JokeGenerator
//
//  Created by Olga Trofimova on 26.08.2024.
//

import Foundation

protocol AlertPresenterProtocol: AnyObject {
    func present(alertModel:AlertModel, id: String?)
}
