//
//  MainSceneTableCellViewModel.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

protocol MainSceneTableCellViewModelType {
    var cellTitle: String { get }
}

class MainSceneTableCellViewModel {
    init(with data: String) {
        self.data = data
    }
    
    private var data: String
}

extension MainSceneTableCellViewModel: MainSceneTableCellViewModelType {
    var cellTitle: String { data }
}
