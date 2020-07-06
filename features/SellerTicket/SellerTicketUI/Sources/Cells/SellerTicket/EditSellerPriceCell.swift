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
  
  private(set) lazy var editSellerPriceItemView: EditSellerPriceItemView = EditSellerPriceItemView()
  private(set) lazy var sendButton: UIButton = UIButton()
  
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
      layout.height = 100% //YGValue(UIScreen.main.bounds.size.height)
    }
    
    editSellerPriceItemView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.position = .relative
    }
    
    sendButton.configureLayout { layout in
      layout.isEnabled = true
      layout.marginHorizontal = 16
      layout.position = .relative
      layout.maxWidth = Int(91.47)%
      layout.marginTop = Int(70)%
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
  }
  
  private func createUI() {
    contentView.addSubview <^> [
      editSellerPriceItemView,
      sendButton
    ]
    
  }
  
  private func configureUI() {
    sendButton.setStyledTitle(Localized.sendButtonTitle, for: .normal)
    sendButton.setStyles(UIButton.Styles.primary)
    
    
    let action = UITapGestureRecognizer(target: self, action: #selector(handleTapAction) )
    editSellerPriceItemView.recomendedPriceInfoIcon.addGestureRecognizer(action)
  }
  
  @objc private func handleTapAction() {
    print("handleTapAction in EditSellerPriceCell")
//    output?.didTapInfoButton(in: self)
  }
}

extension EditSellerPriceCell: EditSellerPriceCellInput {}

extension EditSellerPriceCell: EditSellerPriceItemViewOutput {
  public func didTapAction(in view: EditSellerPriceItemViewInput) {
    print("didTapAction in EditSellerPriceCell")
    output?.didTapInfoButton(in: self)
  }
}

extension EditSellerPriceCell {
  enum Localized {
    public static let sendButtonTitle = "Отправить"
  }
}
