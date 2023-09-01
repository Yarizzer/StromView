//
//  MainSceneViewModel.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

protocol MainSceneViewModelType {
  //Publishers
  var selectedImageDidChanged: Publisher<Bool?> { get }
  
  var currentImageName: String { get }
  
  func getCellViewModel(for index: Int) -> MainSceneTableCellViewModelType
  func selectImage(with index: Int)
}

class MainSceneViewModel {
  init() {
    self.data = AppCore.shared.dataLayer.imageData
  }
  
  var selectedImageDidChanged: Publisher<Bool?> = Publisher(nil)
  
  private var data: [String]
  private var selectedIndex: Int? {
    didSet {
      selectedImageDidChanged.value = true
    }
  }
}

extension MainSceneViewModel: MainSceneViewModelType {
  var currentImageName: String { data[selectedIndex ?? 0] }
  
  func getCellViewModel(for index: Int) -> MainSceneTableCellViewModelType { MainSceneTableCellViewModel(with: data[index]) }
  func selectImage(with index: Int) {
    selectedIndex = index
  }
}

extension MainSceneViewModel: TableViewProviderViewModel {
  var numberOfTableSections: Int { Constants.numberOfSections }
  var numberOfRows: Int { data.count }
  
  func heightForRow(atIndex index: Int) -> Float { Constants.rowHeightValue }
}

extension MainSceneViewModel {
  private struct Constants {
    static let numberOfSections: Int = 1
    static let rowHeightValue: Float = 160.0
  }
}
