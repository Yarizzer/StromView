//
//  MainScenePresenter.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

import Cocoa

class MainScenePresenter {
  init(for vc: MainSceneViewControllerType, service: MainScenePresenterServiceType) {
    self.vc = vc
    self.service = service
    
    service.model.selectedImageDidChanged.subscribe(self) { [weak self] data in
      self?.vc?.update(viewModelDataType: .updateImage(with: self?.service.model))
    }
  }
  
  private var vc: MainSceneViewControllerType?
  private let service: MainScenePresenterServiceType
}

extension MainScenePresenter: MainScenePresentable {
  func response(responseType: MainScenePresenterResponse.MainSceneResponseType) {
    switch responseType {
    case .initial:
      vc?.update(viewModelDataType: .initial(with: service.model))
      vc?.update(viewModelDataType: .setupProvider(with: service.model))
    case .drainView: vc = nil
    }
  }
}
