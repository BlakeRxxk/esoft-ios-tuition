//
//  SpecialistDetailsCell.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit
import Atlas
import BaseFRP
import EsoftUIKit

public final class SpecialistDetailsCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "SpecialistDetailsCellID"
  
  public var phoneNumber: String {
    set {
      phoneRow.title = formatPhoneNumber(number: newValue)
      phoneRow.yoga.markDirty()
    }
    get {
      phoneRow.title
    }
  }
  
  public var email: String {
    set {
      emailRow.title = newValue
      emailRow.yoga.markDirty()
    }
    get {
      emailRow.title
    }
  }
  
  public weak var output: SpecialistDetailsCellOutput?
  
  private(set) lazy var specialistView: SpecialistView = SpecialistView()
  private(set) lazy var phoneRow: IconItemView = {
    $0.output = self
    return $0
  }(IconItemView())
  
  private(set) lazy var emailRow: IconItemView = {
    $0.output = self
    return $0
  }(IconItemView())
  
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
    specialistView.position = ""
    specialistView.avatarURL = nil
  }
  
  private func createUI() {
    contentView.addSubview <^> [
      specialistView,
      phoneRow,
      emailRow
    ]
  }
  
  private func configureUI() {
    contentView.setStyles(UIView.Styles.whiteBackground)
    specialistView.setStyles(SpecialistView.Styles.default)
    
    phoneRow.viewID = SpecialistDetailsCellRow.phone.rawValue
    phoneRow.leftIcon = UIImage.Call.right
    phoneRow.rightIcon = UIImage.Arrow.Right.small
    phoneRow.setStyles(IconItemView.Styles.default)
    
    emailRow.viewID = SpecialistDetailsCellRow.email.rawValue
    emailRow.leftIcon = UIImage.letter
    emailRow.rightIcon = UIImage.Arrow.Right.small
    emailRow.setStyles(IconItemView.Styles.default)
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
    
    emailRow.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValue.large
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
}

extension SpecialistDetailsCell: SpecialistDetailsCellInput {}
