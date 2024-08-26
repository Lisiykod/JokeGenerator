//
//  JokeFactoryDelegate.swift
//  JokeGenerator
//
//  Created by Olga Trofimova on 26.08.2024.
//

import Foundation

protocol JokeFactoryDelegate: AnyObject {
    func didReceivedJoke(joke: JokeModel?)
    func dataDidLoaded()
    func loadDataFailed(with error: Error)
}
