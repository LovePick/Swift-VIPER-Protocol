//
//  Presenter.swift
//  CryptoViper
//
//  Created by Supapon Pucknavin on 12/11/2565 BE.
//

import Foundation

// class, protocol
// Talks to interactor, router, view

enum NetWorkError: Error {
    case networkFailed
    case parsingFailed
}

protocol AnyPresenter {
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidDownloadCryptos(result: Result<[Crypto], Error>)
    func tapOnDetail(_ crypto:Crypto)
}

class CryptoPresenter: AnyPresenter {
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var view: AnyView?
    
    func interactorDidDownloadCryptos(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            view?.update(with: cryptos)
        case .failure(let error):
            print(error)
            view?.update(with: "Try again later...")
        }
    }
    
    func tapOnDetail(_ crypto:Crypto) {
        router?.pushToDetailView(crypto: crypto)
    }
    
}
