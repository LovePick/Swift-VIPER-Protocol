//
//  DetailViewController.swift
//  CryptoViper
//
//  Created by Supapon Pucknavin on 12/11/2565 BE.
//

import Foundation
import UIKit

// Talks to presenter
// Class, protocol
// ViewController
protocol DetailViewProtocol {
    
    var presenter: DetailPresenterProtocol? {get set}
    func update(with crypto: Crypto)
    func update(with error: String)
}

class DetailViewController: UIViewController, DetailViewProtocol {
    
    
    
    // MARK: - COMPONENT
    private let stackView = UIStackView()
    private let currencyLabel = UILabel()
    private let priceLabel = UILabel()
    
    // MARK: - PROPERTY
    var presenter: DetailPresenterProtocol?
    
    var currency: String = ""
    var price: String = ""
    
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
        presenter?.viewDidLoad()
    }
    
    
}

extension DetailViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyLabel.text = "currencyLabel"
        currencyLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        currencyLabel.textColor = .black
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = "priceLabel"
        priceLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        priceLabel.textColor = .darkGray
    }
    
    func layout() {
        stackView.addArrangedSubview(currencyLabel)
        stackView.addArrangedSubview(priceLabel)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

// MARK: - DetailViewProtocol
extension DetailViewController {
    func update(with crypto: Crypto) {
        currencyLabel.text = crypto.currency
        currencyLabel.textColor = .black
        
        priceLabel.text = crypto.price
        priceLabel.textColor = .darkGray
    }
    func update(with error: String) {
        
        currencyLabel.text = error
        currencyLabel.textColor = .red
        
        priceLabel.text = ""
    
    }
}
