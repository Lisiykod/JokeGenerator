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
    
    private var punchline: String?
    
    private let robotoFontName: String = "Roboto-Medium"
    private let fontSize: CGFloat = 16
    private let jokeFontSize: CGFloat = 24
    private let cornerRadius: CGFloat = 8
    private let borderWidth: CGFloat = 2
    private let borderColor: UIColor = .black

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFonts()
        setupViews()
    }
    
    // MARK: - Actions
    @IBAction func jokeRefreshed(_ sender: Any) {
        
    }
    
    @IBAction func showPunchline(_ sender: Any) {
        showPunchlineAlert()
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
    
    private func showPunchlineAlert() {
        let alert = UIAlertController(title: "Punchline", message: punchline, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
}

