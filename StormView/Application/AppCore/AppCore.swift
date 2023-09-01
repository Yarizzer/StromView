//
//  AppCore.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

class AppCore {
  static let shared = AppCore()
  
  private init() {
    self.appDL = AppDataLayer()
    self.appUIL = AppUILayer()
  }
  
  private let appDL: AppDataLayerType
  private let appUIL: AppUILayerType
}

extension AppCore: AppCoreSessionType {
  func prepareSession() { appDL.prepareSession() }
  func openSession() { appDL.openSession() }
  func closeSession() { appDL.closeSession() }
}

extension AppCore: AppCoreDataLayerType {
  var dataLayer: AppDataLayerType { appDL }
}

extension AppCore: AppCoreUILayerType {
  var uiLayer: AppUILayerType { appUIL }
}
