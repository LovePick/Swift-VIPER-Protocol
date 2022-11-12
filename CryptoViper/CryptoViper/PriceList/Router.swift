//
//  Router.swift
//  CryptoViper
//
//  Created by Supapon Pucknavin on 12/11/2565 BE.
//

import Foundation
import UIKit

// class, protocol
// EntryPoint

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? {get}
    static func startExecution() -> AnyRouter
    func pushToDetailView(crypto: Crypto)
}

class CryptoRouter: AnyRouter {

    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        var view: AnyView = CryptoViewController()
        var presenter: AnyPresenter = CryptoPresenter()
        var interactor: AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    func pushToDetailView(crypto: Crypto) {
        
        let detailRouter = DetailRouter.createDetail(with: crypto)
        guard let detailViewController = detailRouter.entry as? DetailViewController else { return }
        guard let viewController = self.entry as? CryptoViewController else { return }
        
        viewController.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
