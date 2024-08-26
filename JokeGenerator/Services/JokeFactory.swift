//
//  JokeFactory.swift
//  JokeGenerator
//
//  Created by Olga Trofimova on 22.08.2024.
//

import Foundation

class JokeFactory: JokeFactoryProtocol {
    
    private let jokeLoader: JokeLoader
    private weak var delegate: JokeFactoryDelegate?
    private var joke: JokeModel?
    
    init(jokeLoader: JokeLoader, delegate: JokeFactoryDelegate) {
        self.jokeLoader = jokeLoader
        self.delegate = delegate
    }
    
    func loadJoke() {
        jokeLoader.loadData { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    self.joke = data
                    self.delegate?.dataDidLoaded()
                case .failure(let error):
                    self.delegate?.loadDataFailed(with: error)
                }
            }
        }
    }
    
    func requestJoke() {
        guard let joke = joke else { return }
        let newJoke = JokeModel(type: joke.type,
                             setup: joke.setup,
                             punchline: joke.punchline,
                             id: joke.id)
        delegate?.didReceivedJoke(joke: newJoke)
    }
    
    
}
