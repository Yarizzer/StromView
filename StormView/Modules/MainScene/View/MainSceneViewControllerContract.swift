//
//  MainSceneViewControllerContract.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

protocol MainSceneViewControllerType {
    func update(viewModelDataType: MainSceneViewControllerViewModel.ViewModelDataType)
}

struct MainSceneViewControllerViewModel {
    enum ViewModelDataType {
        case initial(with: MainSceneViewModelType)
        case setupProvider(with: MainSceneViewModelType)
        case updateImage(with: MainSceneViewModelType?)
    }
}
