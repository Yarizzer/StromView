//
//  AppRouter.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

import Cocoa

protocol AppRoutable {
    func getInitialScene() -> NSViewController
}

class AppRouter { }

extension AppRouter: AppRoutable {
    func getInitialScene() -> NSViewController { MainSceneRouter.assembly() }
}
