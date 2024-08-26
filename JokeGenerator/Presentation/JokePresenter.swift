//
//  JokePresenter.swift
//  JokeGenerator
//
//  Created by Olga Trofimova on 26.08.2024.
//

import Foundation

class JokePresenter: JokeFactoryDelegate {
    
    private var jokeFactory: JokeFactoryProtocol?
    private weak var jokeViewController: JokeViewController?
    
    init(jokeViewController: JokeViewController?) {
        self.jokeFactory = JokeFactory(jokeLoader: JokeLoader(), delegate: self)
        self.jokeViewController = jokeViewController
        jokeFactory?.loadJoke()
        jokeViewController?.showActivityIndicator()
    }
    
    // загружаем новую шутку из фабрики для контроллера
    func requestNewJoke() {
        jokeFactory?.loadJoke()
    }
    
    
    // MARK: - JokeFactoryDelegate
    
    func didReceivedJoke(joke: JokeModel?) {
        guard let joke = joke else { return }
        jokeViewController?.show(joke: joke)
    }
    
    func dataDidLoaded() {
        jokeViewController?.hideActivityIndicator()
        jokeFactory?.requestJoke()
    }
    
    func loadDataFailed(with error: any Error) {
        let message = error.localizedDescription
        jokeViewController?.showAlert(message: message)
    }
    
}
