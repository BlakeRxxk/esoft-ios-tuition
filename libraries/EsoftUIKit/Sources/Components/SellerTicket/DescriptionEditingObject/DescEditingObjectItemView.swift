//
//  DescEditingObjectItemView.swift
//  EsoftUIKit
//
//  Created by wtildestar on 25/06/2020.
//

import UIKit
import BaseUI
import BaseFRP
import ThemeManager
import YogaKit

public final class DescEditingObjectItemView: View {
  public var descLabel: String {
    get {
      descriptionLabel.styledText ?? ""
    }
    set {
      descriptionLabel.styledText = newValue
    }
  }
  
  public weak var output: DescEditingObjectItemViewOutput?
  
  private(set) lazy var mainContainer: UIView = UIView()
  private(set) lazy var descriptionContainer: UIView = UIView()
  private(set) lazy var descriptionSubheader: UILabel = UILabel()
  private(set) lazy var descriptionLabel: UILabel = UILabel()
  private(set) lazy var showMoreLabel: UILabel = UILabel()
  public lazy var editDescRow: IconItemView = IconItemView()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
    layout()
  }
  
  private func createUI() {
    mainContainer.addSubview(descriptionSubheader)
    mainContainer.addSubview(descriptionContainer)
    descriptionContainer.addSubview(descriptionLabel)
    descriptionContainer.addSubview(showMoreLabel)
    mainContainer.addSubview(editDescRow)
    
    addSubview <^> [
      mainContainer
    ]
  }
  
  private func configureUI() {
    descriptionSubheader.text = "Описание"
    descriptionSubheader.setStyles(
      UILabel.Styles.small,
      UILabel.ColorStyle.secondary
    )
    
    descriptionContainer.backgroundColor = ThemeManager.current().colors.container
    
    descriptionLabel.setStyles(
      UILabel.Styles.regular
    )
    descriptionLabel.numberOfLines = 3
    descriptionLabel.text = "Квартира на две стороны (вагончиком), что способствует правильной вентиляции, совмещенный санузел, кладовка"
    descriptionLabel.addCharacterSpacing(kernValue: -0.20)
    
    showMoreLabel.setStyles(
      UILabel.Styles.regular,
      UILabel.ColorStyle.primary500
    )
    showMoreLabel.text = "Показать подробнее..."
    
    editDescRow.title = "Изменить"
    editDescRow.leftIcon = UIImage.Screen5.edit
    editDescRow.setStyles(IconItemView.Styles.primary)
    editDescRow.backgroundColor = ThemeManager.current().colors.container
  }
  
  private func layout() {
    mainContainer.configureLayout { layout in
      layout.isEnabled = true
    }
    
    descriptionSubheader.configureLayout { layout in
      layout.isEnabled = true
      layout.marginTop = 20
      layout.marginHorizontal = 16
    }
    
    descriptionContainer.configureLayout { layout in
      layout.isEnabled = true
      layout.marginTop = 8
      layout.paddingHorizontal = 16
    }
    
    descriptionLabel.configureLayout { layout in
      layout.isEnabled = true
      layout.marginTop = 8
    }
    
    showMoreLabel.configureLayout { layout in
      layout.isEnabled = true
      layout.marginTop = 2
      layout.marginBottom = 8
    }
    
    editDescRow.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValue.large
    }
  }
}

extension DescEditingObjectItemView: DescEditingObjectItemViewInput {}

extension DescEditingObjectItemView: IconItemViewOutput {
  public func didTapAction(in view: IconItemViewInput) {
    print("didTapAction in DescEditingObjectItemView")
    output?.didTapEditDescription(in: self)
  }
}
