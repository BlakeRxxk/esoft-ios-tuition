//
//  SellerTicketCell.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import UIKit
import YogaKit
import Atlas
import BaseFRP
import EsoftUIKit



public final class SellerTicketCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "SellerTicketCellID"
  public var sellerTicketID: Int = 0
  
  // MARK: - CostItem
  public var price: String {
    get {
      costItemView.price
    }
    set {
      costItemView.price = newValue
    }
  }
  
  // MARK: - PhotoItem
  public var dataSet: [String] {
    get {
      photoItemView.dataSet
    }
    set {
      photoItemView.dataSet = newValue
    }
  }
  
  private(set) lazy var costItemView: CostItemViewYoga = CostItemViewYoga()
  private(set) lazy var photoItemView: PhotoItemViewYoga = PhotoItemViewYoga()
  private(set) lazy var descEditingObjectItemView: DescEditingObjectItemView = DescEditingObjectItemView()
  
  public weak var output: SellerTicketCellOutput?
  
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
    
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    costItemView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    descEditingObjectItemView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    photoItemView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
  }
  
  private func createUI() {
    contentView.addSubview <^> [
      costItemView,
      descEditingObjectItemView,
      photoItemView
    ]
  }
  
  private func configureUI() {
    let actionForEditPrice = UITapGestureRecognizer(target: self, action: #selector(handleTapActionForEditPrice) )
    costItemView.editLabel.addGestureRecognizer(actionForEditPrice)
    
    let actionForEditDescription = UITapGestureRecognizer(target: self, action: #selector(handleTapActionForEditDescription) )
    descEditingObjectItemView.editDescRow.addGestureRecognizer(actionForEditDescription)
  }
  
  @objc private func handleTapActionForEditPrice() {
    print("handleTapActionForEditPrice in SellerTicketCell")
    output?.didTapEditSellerPrice(in: self)
  }
  
  @objc private func handleTapActionForEditDescription() {
    print("handleTapActionForEditDescription in SellerTicketCell")
    output?.didTapEditDescription(in: self)
  }
}

extension SellerTicketCell: SellerTicketCellInput {}

extension SellerTicketCell: DescEditingObjectItemViewOutput {
  public func didTapEditDescription(in view: DescEditingObjectItemViewInput) {
    print("didTapEditDescription in SellerTicketCell")
    output?.didTapEditDescription(in: self)
  }
}
