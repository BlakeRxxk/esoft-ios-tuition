//
//  LocationCell.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import Foundation

import UIKit
import YogaKit
import Atlas
import BaseFRP
import EsoftUIKit
import ThemeManager

public final class LocationCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "LocationCellID"
  
  public var location: String? {
    get {
      locationView.location
    }
    set {
      locationView.location = newValue
    }
  }
  
  private(set) lazy var locationContainer: UIView = UIView()
  private(set) lazy var locationView: LocationView = LocationView()
  
  public weak var output: LocationCellOutput?
  
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
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let container = contentView.bounds.size
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    locationContainer.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.marginHorizontal = 16
      layout.marginVertical = 13
    })
    
    locationView.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    })
    
    contentView.yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
  }
  
  private func createUI() {
    [
      locationView
      ].forEach { locationContainer.addSubview($0) }
    
    [
      locationContainer
      ].forEach { contentView.addSubview($0) }
  }
  
  private func configureUI() {
    contentView.setStyles(UIView.Styles.whiteBackground)
    
    let action = UITapGestureRecognizer(target: self, action: #selector(handleTapAction) )
    locationContainer.addGestureRecognizer(action)
  }
  
  @objc private func handleTapAction() {
    output?.didTap(in: self)
  }
}

extension LocationCell: LocationCellInput {}
