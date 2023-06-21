//
//  MainScenePresenterService.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

import Cocoa

protocol MainScenePresenterServiceType {
    var model: MainSceneViewModelType { get }
}

class MainScenePresenterService {
    init(with model: MainSceneViewModelType) {
        self.viewModel = model
    }
    
    private let viewModel: MainSceneViewModelType
}

extension MainScenePresenterService: MainScenePresenterServiceType {
    var model: MainSceneViewModelType { viewModel }
}
