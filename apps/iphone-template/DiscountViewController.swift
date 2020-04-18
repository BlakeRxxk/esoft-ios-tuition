//
//  DiscountViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import AutoLayoutKit
import ThemeManager
import EsoftUIKit
import Atlas

final class DiscountViewController: UIViewController {
  private(set) lazy var container: UIStackView = UIStackView()

  private(set) lazy var button: UIButton = UIButton()

  override func loadView() {
    view = UIView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    createUI()
    configureUI()
    layout()
  }

  private func createUI() {
    view.addSubview(container)
    container.addArrangedSubview(button)
  }

  private func configureUI() {
    view.backgroundColor = ThemeManager.current().colors.container

    container.axis = .vertical
    container.isLayoutMarginsRelativeArrangement = true
    container.layoutMargins = UIEdgeInsets(top: Space.small, left: Space.small, bottom: Space.small, right: Space.small)

    button.setTitle("Button", for: UIControl.State.normal)
    button.backgroundColor = ThemeManager.current().colors.primary500
    button.titleLabel?.setStyles()
  }

  private func layout() {

  }
}
