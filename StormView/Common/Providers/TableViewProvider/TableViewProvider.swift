//
//  TableViewProvider.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

import Cocoa

class TableViewProvider: NSObject, TableViewProviderType {
    init(for tableView: NSTableView, with model: TableViewProviderViewModel) {
        self.tableView = tableView
        self.viewModel = model
        
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    var onConfigureCell: (((column: NSTableColumn?, row: Int)) -> NSTableCellView)?
    var onSelectCell: ((Int) -> Void)?
    
    func registerCells(_ cells: [NSTableCellView.Type]) {
        cells.forEach { registerCell($0) }
    }
    
    func makeView<T>(for index: Int) -> T where T : NSTableCellView {
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: String(describing: T.self)), owner: self) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: T.self))")
        }
        
        return cell
    }
    
    private func registerCell<T>(_ type: T.Type) where T: NSTableCellView {
        guard let nibLoadableType = type as? NibLoadableView.Type else { return }
        
        let nib = NSNib(nibNamed: nibLoadableType.nibName, bundle: Bundle(for: type.self))
        tableView.register(nib, forIdentifier: NSUserInterfaceItemIdentifier(rawValue: String(describing: type)))
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    private let tableView: NSTableView
    private let viewModel: TableViewProviderViewModel
}

extension TableViewProvider: NSTableViewDataSource {
    func numberOfSections(in tableView: NSTableView) -> Int { viewModel.numberOfTableSections }
    func numberOfRows(in tableView: NSTableView) -> Int { viewModel.numberOfRows }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let onConfigureCell else { fatalError("Need to init onConfigureCell") }
        
        return onConfigureCell((column: tableColumn, row: row))
    }
}

extension TableViewProvider: NSTableViewDelegate {
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else { return }
        
        onSelectCell?(tableView.selectedRow)
    }
}
