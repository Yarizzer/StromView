//
//  MainSceneTableCellView.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 21.06.2023.
//

import Cocoa

class MainSceneTableCellView: NSTableCellView {
    override func draw(_ dirtyRect: NSRect) {
        thumbImage.layer?.cornerRadius = thumbImage.frame.height / 2
        thumbImage.layer?.masksToBounds = true
        
        thumbImage.layer?.borderWidth = AppCore.shared.uiLayer.style.layerBorderWidth
        thumbImage.layer?.borderColor = AppCore.shared.uiLayer.style.colorWhite.cgColor
    }
    
    func setup(with model: MainSceneTableCellViewModelType) {
        self.cellTitle.title = model.cellTitle
        
        guard let image = NSImage(named: model.cellTitle) else { return }
        
        thumbImage.image = image
        thumbImage.imageScaling = .scaleAxesIndependently
        
        setupView()
    }
    
    private func setupView() {
        cellTitle.font = AppCore.shared.uiLayer.style.labelTitleFontSmall
        cellTitle.textColor = AppCore.shared.uiLayer.style.colorLightGray
    }
    
    @IBOutlet private weak var thumbImage: NSImageView!
    @IBOutlet private weak var cellTitle: NSTextFieldCell!
}

extension MainSceneTableCellView: NibLoadableView { }
