//
//  DelegateViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import YogaKit

class DelegateViewController: UIViewController {
  private var counter: Int = .zero
  private(set) lazy var titleLabel: UILabel = UILabel()
  private(set) lazy var componentUI: SampleComponent = SampleComponent()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemTeal
    componentUI.sampleText = "tap me"
    componentUI.resetText = "reset me"
    titleLabel.text = "some text: clicked \(counter) times"
    titleLabel.textAlignment = .center
    
    componentUI.output = self
    view.addSubview(titleLabel)
    view.addSubview(componentUI)
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    view.subviews.forEach {
      $0.yoga.markDirty()
    }
    view.yoga.applyLayout(preservingOrigin: true)
    super.traitCollectionDidChange(previousTraitCollection)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let containerSize = view.bounds.size
    view.configureLayout { layout in
      layout.isEnabled = true
      layout.height = YGValue(containerSize.height)
      layout.width = YGValue(containerSize.width)
      layout.flexDirection = .column
      layout.alignItems = .center
      layout.justifyContent = .center
    }
    
    titleLabel.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 24
      layout.margin = 24
    }
    componentUI.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValue(96)
    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }
}

extension DelegateViewController: SampleComponentOutput {
  func didTapActionButton(in sampleView: SampleComponentInput) {
    counter += 1
    titleLabel.text = "some text: clicked \(counter) times"
  }
  
  func reset() {
    counter = 0
    titleLabel.text = "some text: clicked \(counter) times"
  }
}
