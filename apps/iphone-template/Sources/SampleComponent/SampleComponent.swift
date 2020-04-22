//
//  SampleComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import YogaKit

public final class SampleComponent: UIView {
  public var sampleText: String {
    set {
      actionButton.setTitle(newValue, for: .normal)
    }
    get {
      actionButton.titleLabel?.text ?? ""
    }
  }
  
  public var resetText: String {
    set {
      resetButton.setTitle(newValue, for: .normal)
    }
    get {
      resetButton.titleLabel?.text ?? ""
    }
  }
  
  private(set) lazy var titleLabel: UILabel = UILabel()

  private(set) lazy var actionButton: UIButton = {
    $0.addTarget(self, action: #selector(actionButtonDidPressed), for: .touchUpInside)
    return $0
  }(UIButton())
  
  private(set) lazy var resetButton: UIButton = {
    $0.addTarget(self, action: #selector(resetActionButton), for: .touchUpInside)
    return $0
  }(UIButton())

  public weak var output: SampleComponentOutput?

  internal lazy var layout: Layout = Layout()

  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func createUI() {
    addSubview(titleLabel)
    addSubview(actionButton)
    addSubview(resetButton)
  }
  private func configureUI() {
    actionButton.backgroundColor = .systemYellow
    resetButton.backgroundColor = .systemOrange
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    configureLayout(block: layout.container)
    
    titleLabel.configureLayout(block: layout.titleLabel)
    actionButton.configureLayout(block: layout.actionButton)
    resetButton.configureLayout(block: layout.resetButton)
  
    yoga.applyLayout(preservingOrigin: true)
  }
  
  @objc private func actionButtonDidPressed() {
    output?.didTapActionButton(in: self)
  }
  
  @objc private func resetActionButton() {
    output?.reset()
  }
}

extension SampleComponent: SampleComponentInput {}
