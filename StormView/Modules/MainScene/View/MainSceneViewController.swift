//
//  MainSceneViewController.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

import Cocoa

class MainSceneViewController: BaseViewController<MainSceneInteractable> {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        
        setup()
    }
    
    private func setup() {
        mainImage.imageScaling = .scaleAxesIndependently
        
        interactor?.makeRequest(requestType: .initial)
    }
    
    private var provider: TableViewProvider?
    @IBOutlet private weak var tableView: NSTableView!
    @IBOutlet private weak var mainImage: NSImageView!
}

extension MainSceneViewController: MainSceneViewControllerType {
    func update(viewModelDataType: MainSceneViewControllerViewModel.ViewModelDataType) {
        switch viewModelDataType {
        case .initial(let model):
            print(#function)
        case .setupProvider(let model):
            provider = TableViewProvider(for: self.tableView, with: model as! TableViewProviderViewModel)
            provider?.registerCells([MainSceneTableCellView.self])
            provider?.onConfigureCell = { [weak self] data in
                guard let provider = self?.provider else { return NSTableCellView() }
                
                let tableViewCell: MainSceneTableCellView = provider.makeView(for: data.row)
                
                tableViewCell.setup(with: model.getCellViewModel(for: data.row))
                
                return tableViewCell
            }
            provider?.onSelectCell = { [weak self] index in
                self?.interactor?.makeRequest(requestType: .selectImage(withIndex: index))
            }
        case .updateImage(let model):
            guard let model = model, let image = NSImage(named: model.currentImageName) else { return }
            
            NSAnimationContext.runAnimationGroup({ [weak self] context in
                context.duration = Constants.imageUpdateAD / 2
                
                self?.mainImage.animator().alphaValue = Constants.alphaValues.min
            }) { [weak self] in
                self?.mainImage.image = image
                
                NSAnimationContext.runAnimationGroup { [weak self] context in
                    context.duration = Constants.imageUpdateAD / 2
                    
                    self?.mainImage.animator().alphaValue = Constants.alphaValues.max
                }
            }
        }
    }
}

extension MainSceneViewController {
    private struct Constants {
        //Alpha values
        static let alphaValues: (min: CGFloat, max: CGFloat) = (min: 0.0, max: 1.0)
        //Animation duration
        static let imageUpdateAD: Double = 0.6
    }
}
