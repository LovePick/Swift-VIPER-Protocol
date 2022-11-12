//
//  DetailPresenter.swift
//  CryptoViper
//
//  Created by Supapon Pucknavin on 12/11/2565 BE.
//

import Foundation

// class, protocol
// Talks to interactor, router, view
protocol DetailPresenterProtocol {
    var router: DetailRouterProtocol? {get set}
    var interactor: DetailInteractorProtocol? {get set}
    var view: DetailViewProtocol? {get set}
    
    func interactorDidSetCrypto(crypto: Crypto?)
    func viewDidLoad()
}

class DetailPresenter: DetailPresenterProtocol {
    
    
    var router: DetailRouterProtocol?
    
    var interactor: DetailInteractorProtocol?
    
    var view: DetailViewProtocol?
    
    func interactorDidSetCrypto(crypto: Crypto?) {
        if let crypto = crypto {
            view?.update(with: crypto)
        } else {
            view?.update(with: "No data")
        }
        
    }
    
    func viewDidLoad() {
        interactor?.displayDetail()
    }
}
