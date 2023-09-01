//
//  TableViewProviderType.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

import Cocoa

protocol TableViewProviderType {
  var onConfigureCell: (((column: NSTableColumn?, row: Int)) -> NSTableCellView)? { get set }
  var onSelectCell: ((Int) -> Void)? { get set }
  func registerCells(_ cells: [NSTableCellView.Type])
  func makeView<T>(for index: Int) -> T where T: NSTableCellView
  func reloadData()
}
