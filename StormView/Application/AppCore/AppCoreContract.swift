//
//  AppCoreContract.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

protocol AppCoreSessionType {
    func prepareSession()
    func openSession()
    func closeSession()
}

protocol AppCoreDataLayerType {
    var dataLayer: AppDataLayerType { get }
}

protocol AppCoreUILayerType {
    var uiLayer: AppUILayerType { get }
}
