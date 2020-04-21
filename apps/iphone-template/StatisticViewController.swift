//
//  StatisticViewController.swift
//  AppLibrary
//
//  Created by Санек Гилев on 19.04.2020.
//

import UIKit
import EsoftUIKit
import AutoLayoutKit
import ThemeManager

final class SatisticViewController: UIViewController {
    private(set) lazy var container: UIView = UIView()
    
    private(set) lazy var viewsContainer: UIStackView = UIStackView()
    private(set) lazy var viewsText: UILabel = UILabel()
    private(set) lazy var viewsCount: UILabel = UILabel()
    private(set) lazy var viewsIcon: IconItemView = IconItemView()
    


    override func loadView() {
      view = UIView()
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      
      createUI()
      configureUI()
      layout()
    }

    private func createUI(){
        view.addSubview(container)
        
        viewsContainer.addArrangedSubview(viewsText)
        viewsContainer.addArrangedSubview(viewsCount)
        viewsContainer.addArrangedSubview(viewsIcon)
        
        container.addSubview(viewsContainer)
    }

    private func configureUI(){
        view.backgroundColor = ThemeManager.current().colors.container
        
        viewsContainer.axis = .vertical
        viewsContainer.isLayoutMarginsRelativeArrangement = true
        
        viewsText.styledText = Localized.viewsText
        viewsText.setStyles(
            UILabel.Styles.tiny
        )
        
        viewsCount.styledText = Localized.viewsCount
        viewsCount.setStyles(
            UILabel.Styles.title3
        )
        
    }

    private func layout(){
        [
          container,
          viewsContainer,
          viewsText,
          viewsCount,
          viewsIcon
          ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    
    
}
private extension SatisticViewController {
    enum Localized {
      static let viewsText = "Просмотры на сайте"
      static let viewsCount = "72000"
    }
}
