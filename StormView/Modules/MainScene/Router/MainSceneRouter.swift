//
//  MainSceneRouter.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

import Cocoa

protocol MainSceneRoutable {
    static func assembly() -> NSViewController
    func dismiss()
}

class MainSceneRouter {
    private weak var view: MainSceneViewController?
}

extension MainSceneRouter: MainSceneRoutable {
    static func assembly() -> NSViewController {
        let router = MainSceneRouter()
        let vc                  = MainSceneViewController(nibName: String(describing: MainSceneViewController.self), bundle: Bundle.main)
        let viewModel           = MainSceneViewModel()
        let presenterService    = MainScenePresenterService(with: viewModel)
        let presenter           = MainScenePresenter(for: vc, service: presenterService)
        let interactorService   = MainSceneInteractorService(with: viewModel)
        let interactor          = MainSceneInteractor(withRouter: router, presenter: presenter, service: interactorService)
        
        vc.interactor = interactor
        router.view = vc
        
        guard let view = router.view else {
            fatalError("cannot instantiate \(String(describing: MainSceneViewController.self))")
        }
        
        return view
    }
    
    func dismiss() {
        #warning("Remove if no need in this.")
        //view?.dismiss(<#T##viewController: NSViewController##NSViewController#>)
    }
}
