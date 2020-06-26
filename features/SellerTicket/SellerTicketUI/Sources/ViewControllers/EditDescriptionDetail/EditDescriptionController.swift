//
//  EditDescriptionController.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 25/06/2020.
//

import Foundation
import BaseUI
import EsoftUIKit
import RxSwift
import YogaKit
import ThemeManager
import ListKit
import Localized

final public class EditDescriptionController: ViewController<BaseListView> {
  public var disposeBag: DisposeBag = DisposeBag()
  
  public init() {
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = Localized.changeDesc
  }
  
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.navigationBar.setStyles(UINavigationBar.Styles.modal)
    addLeftButtonIfNeeded(target: self, title: Localized.close, action: #selector(handleDismiss))
  }
  
  override public func viewDidLayoutSubviews() {
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
    view.backgroundColor = ThemeManager.current().colors.container
    specializedView.collectionView.backgroundColor = ThemeManager.current().colors.screen
    specializedView.collectionView.refreshControl = nil
  }
  
  @objc private func handleDismiss() {
    self.view.window!.rootViewController?.dismiss(animated: true)
  }
}

extension EditDescriptionController {
  enum Localized {
    public static let search = "search".localize()
    public static let close = "Закрыть"
    public static let changeDesc = "Изменить описание"
  }
}
