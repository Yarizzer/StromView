//
//  AppUILayer.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

class AppUILayer {
  init() {
    self.styleWorker = AppUILayerStyleWorker()
  }
  
  private let styleWorker: AppUILayerStyleWorkerType
}

extension AppUILayer: AppUILayerType {
  var style: AppUILayerStyleWorkerType { styleWorker }
}
