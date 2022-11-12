//
//  DetailRouter.swift
//  CryptoViper
//
//  Created by Supapon Pucknavin on 12/11/2565 BE.
//

import Foundation
import UIKit

// class, protocol
// EntryPoint

typealias DetailEntryPoint = DetailViewProtocol & UIViewController
protocol DetailRouterProtocol {
    var entry: DetailEntryPoint? {get}
    static func createDetail(with crypto:Crypto) -> DetailRouterProtocol
}

class DetailRouter: DetailRouterProtocol {
 
    var entry: DetailEntryPoint?
    
    static func createDetail(with crypto: Crypto) -> DetailRouterProtocol {
        let router = DetailRouter()
        var view: DetailViewProtocol = DetailViewController()
        var presenter: DetailPresenterProtocol = DetailPresenter()
        var interactor: DetailInteractorProtocol = DetailInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.interactor?.crypto = crypto
        
        interactor.presenter = presenter
        
        router.entry = view as? DetailEntryPoint
        
        return router
    }
    
    

}
