//
//  NetworkClient.swift
//  JokeGenerator
//
//  Created by Olga Trofimova on 22.08.2024.
//

import Foundation

protocol NetworkRouting {
    func fetch(url: URL, handler: @escaping (Result<Data, Error>) -> Void)
}

struct NetworkClient: NetworkRouting {
    
    enum NetworkError: Error {
        case errorCode
    }
    
    func fetch(url: URL, handler: @escaping (Result<Data, any Error>) -> Void) {
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                handler(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse,
               response.statusCode < 200 || response.statusCode > 300 {
                handler(.failure(NetworkError.errorCode))
                return
            }
            
            guard let data = data else { return }
            handler(.success(data))
        }
        
        task.resume()
    }
    
    
}
