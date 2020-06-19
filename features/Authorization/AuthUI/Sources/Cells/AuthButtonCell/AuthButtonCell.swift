//
//  AuthButtonCell.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import UIKit
import YogaKit
import BaseUI
import ThemeManager
import EsoftUIKit
import ListKit
import IGListKit
import RxSwift
import RxCocoa
import RxExtensions
import PhoneNumberFormat

public final class AuthButtonCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "AuthButtonCellID"
  
  var disposeBag = DisposeBag()
  
  public var text: String? {
    didSet {
      if !isWaiting {
        button.setStyledTitle(text, for: .normal)
      }
    }
  }
  public var isWaiting: Bool = false {
    didSet {
      if isWaiting {
        button.setStyledTitle(nil, for: .normal)
        button.setImage(UIImage.Spinner.base, for: .normal)
      } else {
        button.setStyledTitle(text, for: .normal)
        button.setImage(nil, for: .normal)
      }
      button.yoga.markDirty()
    }
  }
  
  private(set) lazy var button: UIButton = UIButton()
  
  public weak var output: AuthButtonCellOutput?
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
    bind()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func createUI() {
    contentView.addSubview(button)
  }
  
  private func configureUI() {
    button.setStyles(UIButton.Styles.brand)
  }
  
  private func bind() {
    button.rx
      .tap
      .bind(onNext: { [unowned self] in
        self.output?.didTapeButton()
      })
      .disposed(by: disposeBag)
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let containerSize = contentView.bounds.size
    contentView.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.height = YGValue(containerSize.height)
      layout.width = YGValue(containerSize.width)
    })
    
    button.configureLayout(block: { layout in
        layout.isEnabled = true
        layout.height = 44
        layout.marginHorizontal = 32
    })
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
}

extension AuthButtonCell: AuthButtonCellInput {}
