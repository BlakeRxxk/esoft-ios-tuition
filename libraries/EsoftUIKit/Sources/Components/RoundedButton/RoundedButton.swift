//
//  roundedButton.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit
import BaseUI
import ThemeManager

public final class RoundedButton: UIButton {
  public var viewUUID: String = UUID().uuidString

  private(set) lazy var button: UIButton = UIButton()
  private(set) lazy var title: String = ""

  public func setTitle(title: String) {
    self.title = title
  }

  override init(frame: CGRect) {
      super.init(frame: frame)
  }

  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  public override func layoutSubviews() {
      super.layoutSubviews()
      configureUI()
      layout()
  }

  private func configureUI() {
    self.setTitle(title, for: .normal)
    self.backgroundColor = ThemeManager.current().colors.primary500
    self.layer.cornerRadius = 22
    self.titleLabel?.setStyles(UILabel.Styles.headline)
    self.titleLabel?.tintColor = .red
  }

  private func layout() {
    let constraints = [
      self.heightAnchor.constraint(equalToConstant: Space.large)
    ]

    NSLayoutConstraint.activate(constraints)
  }

}
