//
//  AppDataLayer.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

class AppDataLayer { }

extension AppDataLayer: AppDataLayerType {
  func prepareSession() {
    writeLog(type: .info, message: "remove when ready session handler")
  }
  func openSession() {
    writeLog(type: .info, message: "remove when ready session handler")
  }
  func closeSession() {
    writeLog(type: .info, message: "remove when ready session handler")
  }
  
  var imageData: [String] { ["nssl0033", "nssl0034", "nssl0041", "nssl0042", "nssl0043", "nssl0045", "nssl0046", "nssl0049", "nssl0051", "nssl0091"] }
}
