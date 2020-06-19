//
//  EditSellerPriceCell.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 17/06/2020.
//

import UIKit
import YogaKit
import Atlas
import BaseFRP
import EsoftUIKit

public final class EditSellerPriceCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "EditSellerPriceCellID"
  
  public weak var output: EditSellerPriceCellOutput?
  
//   MARK: - CostItem
//  public var price: String {
//    get {
//      costItemView.price
//    }
//    set {
//      costItemView.price = newValue
//    }
//  }
//
//  // MARK: - PhotoItem
//  public var dataSet: [String] {
//    get {
//      photoItemView.dataSet
//    }
//    set {
//      photoItemView.dataSet = newValue
//    }
//  }
  
//  private(set) lazy var costItemView: CostItemViewYoga = CostItemViewYoga()
//  private(set) lazy var photoItemView: PhotoItemViewYoga = PhotoItemViewYoga()
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    subviews.forEach {
      $0.yoga.markDirty()
    }
    yoga.applyLayout(preservingOrigin: true)
    super.traitCollectionDidChange(previousTraitCollection)
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    //    contentView.backgroundColor = AppTheme.current().colors.screen
    
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
//    costItemView.configureLayout { layout in
//      layout.isEnabled = true
//      layout.width = 100%
//      layout.height = 100%
//    }
//
//    photoItemView.configureLayout { layout in
//      layout.isEnabled = true
//      layout.width = 100%
//      layout.height = 100%
//    }
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
  
  private func createUI() {
    contentView.addSubview <^> [
//      costItemView,
//      photoItemView
    ]
  }
  
  private func configureUI() {
    //    contentView.setStyles(UIView.Styles.whiteBackground)
  }
}

extension EditSellerPriceCell: EditSellerPriceCellInput {}
