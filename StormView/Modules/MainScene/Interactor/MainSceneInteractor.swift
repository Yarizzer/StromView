//
//  MainSceneInteractor.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

class MainSceneInteractor {
  init(withRouter router: MainSceneRoutable, presenter: MainScenePresentable, service: MainSceneInteractorServiceType) {
    self.router = router
    self.presenter = presenter
    self.service = service
  }
  
  private let router: MainSceneRoutable
  private let presenter: MainScenePresentable
  private let service: MainSceneInteractorServiceType
}

extension MainSceneInteractor: MainSceneInteractable {
  func makeRequest(requestType: MainSceneInteractorRequest.RequestType) {
    switch requestType {
    case .initial: presenter.response(responseType: .initial)
    case .selectImage(let index): service.selectImage(with: index)
    }
  }
}
