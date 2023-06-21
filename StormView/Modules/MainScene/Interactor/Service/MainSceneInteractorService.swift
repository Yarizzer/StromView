//
//  MainSceneInteractorService.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

protocol MainSceneInteractorServiceType {
    func selectImage(with index: Int)
}

class MainSceneInteractorService {
    init(with model: MainSceneViewModelType) {
        self.model = model
    }
    
    private let model: MainSceneViewModelType
}

extension MainSceneInteractorService: MainSceneInteractorServiceType {
    func selectImage(with index: Int) {
        model.selectImage(with: index)
    }
}
