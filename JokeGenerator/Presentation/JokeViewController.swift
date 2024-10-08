//
//  JokeViewController.swift
//  JokeGenerator
//
//  Created by Olga Trofimova on 17.08.2024.
//

import UIKit

class JokeViewController: UIViewController {
    
    @IBOutlet private var jokeIDView: UIView!
    @IBOutlet private var jokeIDLabel: UILabel!
    @IBOutlet private var idLabel: UILabel!
    @IBOutlet private var typeView: UIView!
    @IBOutlet private var typeLabel: UILabel!
    @IBOutlet private var typeDinamicLabel: UILabel!
    @IBOutlet private var jokeView: UIView!
    @IBOutlet private var setupLabel: UILabel!
    @IBOutlet private var jokeLabel: UILabel!
    @IBOutlet private var refreshButton: UIButton!
    @IBOutlet private var showPunchlineButton: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private var presenter: JokePresenter?
    private var alertPresenter: AlertPresenterProtocol?
    private var punchline: String = ""
    
    private let robotoFontName: String = "Roboto-Medium"
    private let fontSize: CGFloat = 16
    private let jokeFontSize: CGFloat = 24
    private let cornerRadius: CGFloat = 8
    private let borderWidth: CGFloat = 2
    private let borderColor: UIColor = .borderBlack
    
    private var buttonIsEnable: Bool = false
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFonts()
        setupViews()
        activityIndicator.hidesWhenStopped = true
        initialSetup()
    }
    
    // MARK: - Actions
    @IBAction func jokeRefreshed(_ sender: Any) {
        buttonIsEnable = false
        changeStateButton(isEnabled: buttonIsEnable)
        presenter?.requestNewJoke()
    }
    
    @IBAction func showPunchline(_ sender: Any) {
        showPunchlineAlert()
    }
    
    // MARK: - Public methods
    func showActivityIndicator() {
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    // сообщение об ошибке
    func showAlert(message: String) {
        let alertModel = AlertModel(title: "Error", message: message, buttonText: "OK") {
            self.presenter?.requestNewJoke()
        }
        alertPresenter?.present(alertModel: alertModel, id: nil)
    }
    
    // показываем шутку
   func show(joke: JokeModel) {
        idLabel.text = String(joke.id)
        typeDinamicLabel.text = joke.type
        jokeLabel.text = joke.setup
        punchline = joke.punchline
    }
    
    // делаем кнопку рефреш доступной
    func enableButton() {
        buttonIsEnable = true
        changeStateButton(isEnabled: buttonIsEnable)
    }
    
    // MARK: - Private methods
    private func setupFonts() {
        jokeIDLabel.font = UIFont(name: robotoFontName, size: fontSize)
        idLabel.font = UIFont(name: robotoFontName, size: fontSize)
        typeLabel.font = UIFont(name: robotoFontName, size: fontSize)
        typeDinamicLabel.font = UIFont(name: robotoFontName, size: fontSize)
        setupLabel.font = UIFont(name: robotoFontName, size: fontSize)
        jokeLabel.font = UIFont(name: robotoFontName, size: jokeFontSize)
        showPunchlineButton.titleLabel?.font =  UIFont(name: robotoFontName, size: fontSize)
    }
    
    private func setupViews() {
        jokeIDView.layer.borderWidth = borderWidth
        typeView.layer.borderWidth = borderWidth
        jokeView.layer.borderWidth = borderWidth
        refreshButton.layer.borderWidth = borderWidth
        showPunchlineButton.layer.borderWidth = borderWidth
        
        jokeIDView.layer.borderColor = borderColor.cgColor
        typeView.layer.borderColor = borderColor.cgColor
        jokeView.layer.borderColor = borderColor.cgColor
        refreshButton.layer.borderColor = borderColor.cgColor
        showPunchlineButton.layer.borderColor = borderColor.cgColor
        
        jokeIDView.layer.cornerRadius = cornerRadius
        typeView.layer.cornerRadius = cornerRadius
        jokeView.layer.cornerRadius = cornerRadius
        refreshButton.layer.cornerRadius = cornerRadius
        showPunchlineButton.layer.cornerRadius = cornerRadius
    }
    
    // сообщение с шуткой
    private func showPunchlineAlert() {
        let alertModel = AlertModel(title: "Punchline", message: punchline, buttonText: "OK") {
            self.presenter?.requestNewJoke()
        }
        alertPresenter?.present(alertModel: alertModel, id: nil)
    }
    
    // настраиваем связи с нужными сущностями
    private func initialSetup() {
        alertPresenter = AlertPresenter(delegate: self)
        presenter = JokePresenter(jokeViewController: self)
    }
    
    private func changeStateButton(isEnabled: Bool) {
        refreshButton.isEnabled = isEnabled
    }
    
}

