//
//  AlertPresenter.swift
//  JokeGenerator
//
//  Created by Olga Trofimova on 26.08.2024.
//

import UIKit

class AlertPresenter: AlertPresenterProtocol {
    
    weak var delegate: UIViewController?
    
    init(delegate: UIViewController?) {
        self.delegate = delegate
    }
    
    func present(alertModel: AlertModel, id: String?) {
        let alert = UIAlertController(title: alertModel.title,
                                      message: alertModel.message,
                                      preferredStyle: .alert)
        // настраиваем id для доступности, и для тестов
        alert.view.accessibilityIdentifier = id
        let action = UIAlertAction(title: alertModel.buttonText, style: .default) { _ in
            alertModel.completion()
        }
        alert.addAction(action)
        delegate?.present(alert, animated: true)
    }
    
}
