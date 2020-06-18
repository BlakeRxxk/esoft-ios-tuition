//
//  PasswordViewController.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import UIKit
import BaseUI
import EsoftUIKit
import YogaKit
import RxSwift
import RxCocoa
import RxExtensions
import ListKit

public protocol CitiesBuilder {
  var citiesViewController: UIViewController { get }
}

final public class PasswordViewController: ViewController<BaseListView> {
  public var disposeBag: DisposeBag = DisposeBag()
  
  private var citiesBuilder: CitiesBuilder
  
  public init(_ citiesBuilder: CitiesBuilder) {
    self.citiesBuilder = citiesBuilder
    
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
  }
  
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.setStyles(UINavigationItem.Styles.logo)
    navigationController?.navigationBar.setStyles(UINavigationBar.Styles.auth)
    addBackButtonIfNeeded(target: self, action: #selector(handleDismiss))
  }

  public override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    let container = view.bounds.size
    view.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    specializedView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }
  
  private func configureUI() {
    specializedView.collectionView.setStyles(UIView.Styles.whiteBackground)
    specializedView.collectionView.refreshControl = nil
    specializedView.collectionView.bounces = false
  }
   
  @objc private func handleDismiss(sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}

extension PasswordViewController: PasswordSectionControllerOutput {
  public func didTapContinueButton() {
    show(citiesBuilder.citiesViewController, sender: nil)
  }
  
  public func passwordDidChange(newVal: String) {
    print(newVal)
  }
}
