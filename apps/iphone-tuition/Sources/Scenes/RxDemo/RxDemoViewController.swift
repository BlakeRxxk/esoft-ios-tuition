//
//  RxDemoViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import YogaKit

final class RxDemoViewController: UIViewController {
  private let disposeBag: DisposeBag = DisposeBag()
  private let networkAPI = CatalogsAPI(session: .init(.shared),
                                       baseUrl: URL(string: "https://developers.etagi.com/api/v2/catalogs")!)

  private(set) lazy var button: UIButton = UIButton()

  override func loadView() {
    view = UIView()
    
    createUI()
    configureUI()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = AppTheme.current().colors.container
    
//    button.rx
//      .tap
//      .startWith("tap me")
//      .bind(to: button.rx.title(for: .normal))
//      .disposed(by: disposeBag)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
//    let url = URL(string: "https://developers.etagi.com/api/v2/catalogs/cities/list?api_key=demo_mobile&limit=10")!
//
//    networkAPI
//      .getCities(url: url)
//      .subscribe(onSuccess: { res in
//          print(res)
//        }) { err in
//          print(err)
//      }
//      .disposed(by: disposeBag)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    let container = view.bounds.size
    view.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
      layout.alignItems = .center
      layout.justifyContent = .center
      layout.flexDirection = .column
    }
    
    button.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 200
      layout.height = 48
    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }
  
  private func createUI() {
    view.addSubview(button)
  }

  private func configureUI() {
    button.backgroundColor = AppTheme.current().colors.accent500
  }
}
