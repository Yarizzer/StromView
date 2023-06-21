//
//  MainSceneInteractorContract.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

protocol MainSceneInteractable {
    func makeRequest(requestType: MainSceneInteractorRequest.RequestType)
}

struct MainSceneInteractorRequest {
    enum RequestType {
        case initial
        case selectImage(withIndex: Int)
    }
}
