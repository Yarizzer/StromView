//
//  MainScenePresenterContract.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

protocol MainScenePresentable {
    func response(responseType: MainScenePresenterResponse.MainSceneResponseType)
}

struct MainScenePresenterResponse {
    enum MainSceneResponseType {
        case initial
        case drainView
    }
}
