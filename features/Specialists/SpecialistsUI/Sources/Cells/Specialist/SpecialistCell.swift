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

public final class SpecialistCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "SpecialistCellID"
  public var specialistID: Int = 0
  public var isChatAvaliable: Bool = false
  
  public var specialistName: String {
    set {
      specialistView.fullName = newValue
    }
    get {
      specialistView.fullName
    }
  }
  
  public var phoneNumber: String {
    set {
      phoneRow.title = formatPhoneNumber(number: newValue)
      phoneRow.yoga.markDirty()
    }
    get {
      phoneRow.title
    }
  }
  
  private(set) lazy var specialistView: SpecialistView = SpecialistView()
  private(set) lazy var phoneRow: IconItemView = {
    $0.output = self
    return $0
  }(IconItemView())
  
  private(set) lazy var chatRow: IconItemView = {
    $0.output = self
    return $0
  }(IconItemView())
  
  public weak var output: SpecialistCellOutput?
  
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
    specialistID = 0
    isChatAvaliable = false
    specialistView.position = ""
    specialistView.avatarURL = nil
    chatRow.setStyles(IconItemView.Styles.inactive)
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    specialistView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValue(80)
    }
    
    phoneRow.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValue.large
    }
    
    chatRow.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValue.large
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
  }
  
  private func createUI() {
    contentView.addSubview <^> [
      specialistView,
      phoneRow,
      chatRow
    ]
  }
  
  private func configureUI() {
    contentView.setStyles(UIView.Styles.whiteBackground)
    specialistView.setStyles(SpecialistView.Styles.withAction)
    
    phoneRow.viewID = SpecialistCellRow.phone.rawValue
    phoneRow.leftIcon = UIImage.Call.right
    phoneRow.setStyles(IconItemView.Styles.primary)
    
    chatRow.title = "Чат со специалистом"
    chatRow.viewID = SpecialistCellRow.chat.rawValue
    chatRow.leftIcon = UIImage.Consultant.base
    chatRow.setStyles(IconItemView.Styles.inactive)
    
    let action = UITapGestureRecognizer(target: self, action: #selector(handleTapAction) )
    specialistView.addGestureRecognizer(action)
  }
  
  @objc private func handleTapAction() {
    output?.didTapSpecialist(in: self)
  }
}

extension SpecialistCell: SpecialistCellInput {}

extension SpecialistCell: IconItemViewOutput {
  enum SpecialistCellRow: String {
    case phone = "phoneRow"
    case chat = "chatRow"
  }
  
  public func didTapAction(in view: IconItemViewInput) {
    let row = SpecialistCellRow.init(rawValue: view.viewID)
    switch row {
    case .phone:
      didTapCallRow()
    case .chat:
      didTapChatAction()
    case .none: break
    }
  }
  
  private func didTapCallRow() {
    output?.didTapPhone(in: self)
  }
  
  private func didTapChatAction() {
    output?.didTapChat(in: self)
  }
  
  private func formatPhoneNumber(number: String) -> String {
    number
  }
}
