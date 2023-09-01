//
//  AppUILayerStyleWorker.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

import Cocoa

class AppUILayerStyleWorker {
  //MARK: - Style
  private enum StyleColors {
    case clear
    case white
    case black
    case lightGray
    case gray
    case darkGray
    case red
    case green
    case orange
    
    var color: NSColor {
      switch self {
      case .clear:        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
      case .white:        return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      case .black:        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      case .lightGray:    return #colorLiteral(red: 0.9372547865, green: 0.9372549653, blue: 0.9415605664, alpha: 1)        // hex: EFEFF0
      case .gray:         return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)        // hex: 808080
      case .darkGray:     return #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.2352941176, alpha: 1)        // hex: 3C3C3C
      case .red:          return #colorLiteral(red: 1, green: 0.3137254902, blue: 0, alpha: 1)        // hex: FF5000
      case .green:        return #colorLiteral(red: 0, green: 0.6666666667, blue: 0.3137254902, alpha: 1)        // hex: 00AA50
      case .orange:       return #colorLiteral(red: 0.9725490196, green: 0.5921568627, blue: 0, alpha: 1)        // hex: F89700
      }
    }
  }
}

extension AppUILayerStyleWorker: AppUILayerStyleWorkerType {
  //Colors
  var colorClear: NSColor { StyleColors.clear.color }
  var colorWhite: NSColor { StyleColors.white.color }
  var colorBlack: NSColor { StyleColors.black.color }
  var colorLightGray: NSColor { StyleColors.lightGray.color }
  var colorGray: NSColor { StyleColors.gray.color }
  var colorDarkGray: NSColor { StyleColors.darkGray.color }
  var colorRed: NSColor { StyleColors.red.color }
  var colorGreen: NSColor { StyleColors.green.color }
  var colorOrange: NSColor { StyleColors.orange.color }
  //Fonts
  var labelTitleFontExtraLarge: NSFont {  Constants.extraLargeFont }
  var labelTitleFontLarge: NSFont { Constants.largeFont }
  var labelTitleFontMedium: NSFont {  Constants.mediumFont }
  var labelTitleFontSmall: NSFont {  Constants.smallFont }
  //Layers
  var layerBorderWidth: CGFloat { Constants.layerData.borderWidth }
  var layerLineWidth: CGFloat { Constants.layerData.lineWidth }
}

extension AppUILayerStyleWorker {
  private struct Constants {
    static let extraLargeFont: NSFont = NSFont(name: "AppleSDGothicNeo-UltraLight", size: 30) ?? NSFont.systemFont(ofSize: 30)
    static let largeFont: NSFont = NSFont(name: "AppleSDGothicNeo-UltraLight", size: 20) ?? NSFont.systemFont(ofSize: 20)
    static let mediumFont: NSFont = NSFont(name: "AppleSDGothicNeo-UltraLight", size: 15) ?? NSFont.systemFont(ofSize: 15)
    static let smallFont: NSFont = NSFont(name: "AppleSDGothicNeo-UltraLight", size: 12) ?? NSFont.systemFont(ofSize: 12)
    static let layerData: (borderWidth: CGFloat, lineWidth: CGFloat) = (borderWidth: 1.0, lineWidth: 1.2)
  }
}
