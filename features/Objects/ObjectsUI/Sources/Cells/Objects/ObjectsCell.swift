//
//  SpecialistCell.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit
import Atlas
import BaseFRP
import EsoftUIKit

public final class ObjectsCell: UICollectionViewCell {
  
  // MARK: - Properties
  
  private static let reuseIdentifier: String = "ObjectsCellID"
  public weak var output: ObjectsCellOutput?
  
  // MARK: - UI
  
  public var currentPrice: String {
    get {
      previewItemView.currentPrice
    }
    set {
      previewItemView.currentPrice = newValue
    }
  }
  
  public var oldPrice: String {
    get {
      previewItemView.oldPrice
    }
    set {
      previewItemView.oldPrice = newValue
    }
  }
  
  public var address: String {
    get {
      previewItemView.address
    }
    set {
      previewItemView.address = newValue
    }
  }
  
  public var photos: [String] {
    get {
      previewItemView.photos
    }
    set {
      previewItemView.photos = newValue
    }
  }
  
  public var objectsDescription: String {
    get {
      previewItemView.objectsDescription
    }
    set {
      previewItemView.objectsDescription = newValue
    }
  }
  
  public var views: String {
    get {
      previewItemView.views
    }
    set {
      previewItemView.views = newValue
    }
  }
  
  public var favorites: String {
    get {
      previewItemView.favorites
    }
    set {
      previewItemView.favorites = newValue
    }
  }
  
  public var code: String {
    get {
      previewItemView.code
    }
    set {
      previewItemView.code = newValue
    }
  }
  
  private(set) lazy var previewItemView: PreviewItemViewYOGA = PreviewItemViewYOGA()
  
  
  // MARK: - Init
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Functions
  
  override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    subviews.forEach {
      $0.yoga.markDirty()
    }
    yoga.applyLayout(preservingOrigin: true)
    super.traitCollectionDidChange(previousTraitCollection)
  }
  
  override public func prepareForReuse() {
    super.prepareForReuse()
    
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    previewItemView.configureLayout { (layout) in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
  }
  
  private func createUI() {
    contentView.addSubview <^> [
      previewItemView
    ]
  }
  
  private func configureUI() {
    contentView.setStyles(UIView.Styles.whiteBackground)
//    specialistView.setStyles(SpecialistView.Styles.withAction)
//
//    phoneRow.viewID = SpecialistCellRow.phone.rawValue
//    phoneRow.leftIcon = UIImage.Call.right
//    phoneRow.setStyles(IconItemView.Styles.primary)
//
//    chatRow.title = "Чат со специалистом"
//    chatRow.viewID = SpecialistCellRow.chat.rawValue
//    chatRow.leftIcon = UIImage.Consultant.base
//    chatRow.setStyles(IconItemView.Styles.inactive)
    
  }
  
}

extension ObjectsCell: ObjectsCellInput {}

