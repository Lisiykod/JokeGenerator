//
//  JokeLoader.swift
//  JokeGenerator
//
//  Created by Olga Trofimova on 22.08.2024.
//

import Foundation

struct JokeLoader {
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    private var url: URL{
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {
                   preconditionFailure("not valid url")
               }
               return url
    }
    
    func loadData(handler: @escaping (Result<JokeModel, any Error>) -> Void) {
        networkClient.fetch(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let joke = try JSONDecoder().decode(JokeModel.self, from: data)
                    handler(.success(joke))
                } catch {
                    handler(.failure(error))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
