//
//  AppUILayerStyleWorkerType.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

import Cocoa

protocol AppUILayerStyleWorkerType {
    //Colors
    var colorClear: NSColor { get }
    var colorWhite: NSColor { get }
    var colorBlack: NSColor { get }
    var colorLightGray: NSColor { get }
    var colorGray: NSColor { get }
    var colorDarkGray: NSColor { get }
    var colorRed: NSColor { get }
    var colorGreen: NSColor { get }
    var colorOrange: NSColor { get }

    //Fonts
    var labelTitleFontExtraLarge: NSFont { get }
    var labelTitleFontLarge: NSFont { get }
    var labelTitleFontMedium: NSFont { get }
    var labelTitleFontSmall: NSFont { get }
    //Layers
    var layerBorderWidth: CGFloat { get }
    var layerLineWidth: CGFloat { get }
}
