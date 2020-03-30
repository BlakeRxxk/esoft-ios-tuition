//
//  ViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import YogaKit

class ViewController: UIViewController {
  private var counter: Int = .zero
  private(set) lazy var componentUI: SampleComponent = {
    $0.output = self
    return $0
  }(SampleComponent())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemTeal
    componentUI.sampleText = "some text"
    
    view.addSubview(componentUI)
    // Do any additional setup after loading the view.
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
    
    componentUI.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }
}

extension ViewController: SampleComponentOutput {
  func didTapActionButton(in sampleView: SampleComponentInput) {
    counter += 1
    componentUI.sampleText = "some text: clicked \(counter) times"
  }
}
