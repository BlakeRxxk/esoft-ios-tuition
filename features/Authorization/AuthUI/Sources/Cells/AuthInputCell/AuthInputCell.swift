//
//  PhoneInputCell.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import UIKit
import YogaKit
import EsoftUIKit
import RxSwift
import RxCocoa
import RxExtensions

public final class AuthInputCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "AuthInputCellID"
  
  var disposeBag = DisposeBag()
  
  public var text: String? {
    get {
      errorTextField.textField.text
    }
    set {
      errorTextField.textField.text = newValue
    }
  }
  public var placeholder: String? {
    get {
      errorTextField.textField.placeholder
    }
    set {
      errorTextField.textField.placeholder = newValue
    }
  }
  public var keyboardType: UIKeyboardType {
    get {
      errorTextField.textField.keyboardType
    }
    set {
      errorTextField.textField.keyboardType = newValue
    }
  }
  public var showButton: Bool {
    get {
      errorTextField.showButton
    }
    set {
      errorTextField.showButton = newValue
    }
  }
  public var errorMessage: String? {
    get {
      errorTextField.errorMessage
    }
    set {
      errorTextField.errorMessage = newValue
    }
  }
  public var formatter: MyFormatter?
  
  private(set) lazy var textFieldContainer: UIView = UIView()
  private(set) lazy var errorTextField: ErrorTextField = ErrorTextField()
  
  public weak var output: AuthInputCellOutput?
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    bind()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func createUI() {
    textFieldContainer.addSubview(errorTextField)
    
    contentView.addSubview(textFieldContainer)
  }
  
  private func bind() {
    errorTextField.textField.rx
      .text
      .map { [unowned self] text -> String in
        let text = text ?? ""
        guard let formatter = self.formatter else {
          return text
        }
        return formatter(text)
      }
      .do(onNext: { [unowned self] text in
        self.output?.textDidChange(newVal: text)
      })
      .bind(to: errorTextField.textField.rx.text)
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
    
    textFieldContainer.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.height = 64
    })
    errorTextField.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.paddingHorizontal = 32
    })
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
}

extension AuthInputCell: AuthInputCellInput {}
