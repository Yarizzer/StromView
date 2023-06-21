//
//  NibLoadableView.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

import Cocoa

protocol NibLoadableView: AnyObject {
    static var nibName: String { get }
}

extension NibLoadableView where Self: NSView {
    static var nibName: String { String(describing: self) }
}

extension NibLoadableView where Self: NSViewController {
    static var nibName: String { String(describing: self) }
}
