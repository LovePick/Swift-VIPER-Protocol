//
//  DetailInteractor.swift
//  CryptoViper
//
//  Created by Supapon Pucknavin on 12/11/2565 BE.
//

import Foundation

// Class, protocal
// Talks to Presenter
protocol DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol? {get set}
    var crypto: Crypto? {get set}
    func displayDetail()
}

class DetailInteractor: DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol?
    
    var crypto: Crypto? {
        didSet {
            displayDetail()
        }
    }
    
    func displayDetail() {
        presenter?.interactorDidSetCrypto(crypto: crypto)
    }
}
