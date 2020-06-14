//
//  CityCell.swift
//  orization#iphonesimulator-x86_64
//
//  Created by nedstar on 27.05.2020.
//

import UIKit
import YogaKit
import Atlas
import BaseFRP
import EsoftUIKit
import ThemeManager

public final class CityCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "CityCellID"
  
  public var cityId: Int = 0
  public var lastCell: Bool = false {
    didSet {
      updateControlElements()
    }
  }
  
  private(set) lazy var cityContainer: UIView = UIView()
  private(set) lazy var cityView: ItemView = ItemView()
  private(set) lazy var divider: UIView = UIView()

  internal lazy var layoutController: LayoutController = LayoutController()
  internal lazy var layout: Layout = Layout()
  
  public weak var output: CityCellOutput?
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
//  override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//    subviews.forEach {
//      $0.yoga.markDirty()
//    }
//    yoga.applyLayout(preservingOrigin: true)
//    super.traitCollectionDidChange(previousTraitCollection)
//  }
  
  override public func prepareForReuse() {
    super.prepareForReuse()
    cityId = 0
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let container = contentView.bounds.size
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
      layout.flexDirection = .column
    }
//    contentView.configureLayout(block: layout.container)
    
    cityContainer.configureLayout(block: layout.cityContainer)
    
    cityView.configureLayout(block: layout.cityView)
    
    divider.configureLayout(block: layout.divider)
    
    contentView.yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
  }
  
  private func createUI() {
    [
      cityView,
      divider
      ].forEach { cityContainer.addSubview($0) }
    
    [
      cityContainer
      ].forEach { contentView.addSubview($0) }
  }
  
  private func configureUI() {
    contentView.setStyles(UIView.Styles.whiteBackground)
    
    let action = UITapGestureRecognizer(target: self, action: #selector(handleTapAction) )
    cityContainer.addGestureRecognizer(action)
    
    divider.backgroundColor = ThemeManager.current().colors.screen
  }
  
  private func updateControlElements() {
    updateDivider()
  }
  
  @objc private func handleTapAction() {
    output?.didTap(in: self)
  }
}

extension CityCell: CityCellInput {}
