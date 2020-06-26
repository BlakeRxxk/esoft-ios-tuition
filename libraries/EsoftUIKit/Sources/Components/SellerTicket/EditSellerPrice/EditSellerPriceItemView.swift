//
//  EditSellerPriceItemView.swift
//  EsoftUIKit
//
//  Created by wtildestar on 17/06/2020.
//

import UIKit
import BaseUI
import BaseFRP
import ThemeManager
import YogaKit

public final class EditSellerPriceItemView: View {
  public var recomendedPrice: String {
    get {
      recomendedPriceLabel.styledText ?? ""
    }
    set {
      recomendedPriceLabel.styledText = newValue
    }
  }
  
  private(set) lazy var mainContainer: UIView = UIView()
  private(set) lazy var currentPriceLabelSmall: UILabel = UILabel()
  private(set) lazy var currentPriceLabel: UILabel = UILabel()
  private(set) lazy var dividerForCurrentPrice: UIView = UIView()
  private(set) lazy var recomendedPriceLabelSmall: UILabel = UILabel()
  private(set) lazy var recomendedPriceLabel: UILabel = UILabel()
  public lazy var recomendedPriceInfoIcon: UIImageView = UIImageView()
  private(set) lazy var dividerForRecomendedPrice: UIView = UIView()
  private(set) lazy var newPriceTextField: UITextField = UITextField()
  private(set) lazy var dividerForNewPrice: UIView = UIView()
  private(set) lazy var noteLabel: UILabel = UILabel()
  
  public weak var output: EditSellerPriceItemViewOutput?
  
  override public init() {
    super.init()
    createUI()
    configureUI()
    layout()
  }
  
  private func createUI() {
    mainContainer.addSubview(currentPriceLabelSmall)
    mainContainer.addSubview(currentPriceLabel)
    mainContainer.addSubview(dividerForCurrentPrice)
    mainContainer.addSubview(recomendedPriceLabelSmall)
    mainContainer.addSubview(recomendedPriceLabel)
    mainContainer.addSubview(recomendedPriceInfoIcon)
    mainContainer.addSubview(dividerForRecomendedPrice)
    mainContainer.addSubview(newPriceTextField)
    mainContainer.addSubview(dividerForNewPrice)
    mainContainer.addSubview(noteLabel)
    
    addSubview <^> [
      mainContainer
    ]
  }
  
  private func configureUI() {
    currentPriceLabelSmall.text = Localized.currentPriceLabelSmall
    currentPriceLabel.text = Localized.currentPriceLabel
    recomendedPriceLabelSmall.text = Localized.recomendedPriceLabelSmall
    recomendedPriceLabel.text = Localized.recomendedPriceLabel
    newPriceTextField.placeholder = Localized.newPriceTextFieldPlaceholder
    noteLabel.text = Localized.noteLabel
    
    mainContainer.backgroundColor = ThemeManager.current().colors.container
    
    currentPriceLabelSmall.setStyles(
      UILabel.Styles.tiny,
      UILabel.ColorStyle.placeholders
    )
    
    recomendedPriceLabelSmall.setStyles(
      UILabel.Styles.tiny,
      UILabel.ColorStyle.placeholders
    )
    
    recomendedPriceInfoIcon.image = UIImage.NoticeInfo.base
    recomendedPriceInfoIcon.tintColor = ThemeManager.current().colors.primary500
    
    noteLabel.setStyles(
      UILabel.Styles.tiny,
      UILabel.ColorStyle.placeholders
    )
    
    noteLabel.numberOfLines = 2
    
    dividerForCurrentPrice.backgroundColor = ThemeManager.current().colors.divider
    dividerForRecomendedPrice.backgroundColor = ThemeManager.current().colors.divider
    dividerForNewPrice.backgroundColor = ThemeManager.current().colors.divider
    
//    let action = UITapGestureRecognizer(target: self, action: #selector(handleTapAction) )
//    addGestureRecognizer(action)
  }
  
//  @objc private func handleTapAction() {
//    print("handleTapAction in EditSellerPriceItemView")
//    output?.didTapAction(in: self)
//  }
  
  private func layout() {
    mainContainer.configureLayout { layout in
      layout.isEnabled = true
      layout.height = 237
      layout.marginTop = 8
      layout.paddingHorizontal = 16
    }
    
    currentPriceLabelSmall.configureLayout { layout in
      layout.isEnabled = true
      layout.marginTop = 10
      layout.marginBottom = 4
    }
    
    currentPriceLabel.configureLayout { layout in
      layout.isEnabled = true
      layout.marginBottom = 10
    }
    
    dividerForCurrentPrice.configureLayout { layout in
      layout.isEnabled = true
      layout.height = 1
      layout.width = 100%
    }
    
    recomendedPriceLabelSmall.configureLayout { layout in
      layout.isEnabled = true
      layout.marginTop = 10
      layout.marginBottom = 4
    }
    
    recomendedPriceLabel.configureLayout { layout in
      layout.isEnabled = true
      layout.marginBottom = 10
    }
    
    recomendedPriceInfoIcon.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 22
      layout.height = 22
      layout.position = .absolute
      layout.right = 17
      layout.top = 85
    }
    
    dividerForRecomendedPrice.configureLayout { layout in
      layout.isEnabled = true
      layout.height = 1
      layout.width = 100%
    }
    
    newPriceTextField.configureLayout { layout in
      layout.isEnabled = true
      layout.marginVertical = 22
      layout.marginLeft = -4
    }
    
    dividerForNewPrice.configureLayout { layout in
      layout.isEnabled = true
      layout.height = 1
      layout.width = 100%
    }
    
    noteLabel.configureLayout { layout in
      layout.isEnabled = true
      layout.marginVertical = 4
    }
  }
}

extension EditSellerPriceItemView: EditSellerPriceItemViewInput {}

extension EditSellerPriceItemView {
  enum Localized {
    public static let currentPriceLabelSmall = "Текущая цена"
    public static let currentPriceLabel = "4 600 000 руб."
    public static let recomendedPriceLabelSmall = "Рекомендованная цена"
    public static let recomendedPriceLabel = "4 560 000 руб."
    public static let newPriceTextFieldPlaceholder = " Новая цена, руб."
    public static let noteLabel = "Возможно повышение или понижение цены до 20% от текущей суммы"
  }
}
