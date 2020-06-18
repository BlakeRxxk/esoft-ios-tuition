//
//  SpecialistDetailsActionCell.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit
import Atlas
import EsoftUIKit

public final class SpecialistDetailsActionCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "SpecialistDetailsActionCellID"

  public var title: String {
    get {
      actionRow.title
    }
    set {
      actionRow.title = newValue
    }
  }
  
  public var icon: UIImage {
    get {
      actionRow.leftIcon ?? UIImage()
    }
    set {
      actionRow.leftIconView.image = newValue
      actionRow.leftIconView.yoga.markDirty()
    }
  }
  
  public var value: String = ""
  
  var actionStyle: SpecialistDetailsActionCell.ActionStyle = .inactive {
    didSet {
      updateControlElements()
    }
  }

  private(set) lazy var actionRow: IconItemView = {
    $0.output = self
    return $0
  }(IconItemView())

  public weak var output: SpecialistDetailsActionCellOutput?
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func prepareForReuse() {
    super.prepareForReuse()
    actionRow.title = ""
    actionStyle = .inactive
  }
  
  private func createUI() {
    contentView.addSubview(actionRow)
  }
  
  private func configureUI() {
    contentView.setStyles(UIView.Styles.whiteBackground)
    actionRow.setStyles(IconItemView.Styles.inactive)
  }

  override public func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }

    actionRow.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValue.large
    }

    contentView.yoga.applyLayout(preservingOrigin: true)
  }
  
  private func updateControlElements() {
    switch actionStyle {
    case .inactive:
      actionRow.setStyles(IconItemView.Styles.inactive)
    case .primary:
      actionRow.setStyles(IconItemView.Styles.primary)
    }
    
  }
}

extension SpecialistDetailsActionCell: SpecialistDetailsActionCellInput {}
