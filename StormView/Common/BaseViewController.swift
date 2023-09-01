//
//  BaseViewController.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

import Cocoa

class BaseViewController<InteractorT>: NSViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  var interactor: InteractorT?
}
