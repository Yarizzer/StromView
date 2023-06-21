//
//  TableViewProviderViewModel.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

protocol TableViewProviderViewModel {
    var numberOfTableSections: Int { get }
    var numberOfRows: Int { get }
    
    func heightForRow(atIndex index: Int) -> Float
}
