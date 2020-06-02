//
//  PreviewViewSkeleton.swift
//  EsoftUIKit
//
//  Created by Алексей Макаров on 02.06.2020.
//

import YogaKit
import ShimmerUI
import BaseFRP
import BaseUI

public final class PreviewViewSkeleton: View {
  
  // MARK: - UI
  
  private(set) lazy var container: UIView = UIView()
  
  private(set) var priceStub: UIView = UIView()
  private(set) var priceShimmerView: ShimmeringView = ShimmeringView()
  
  private(set) var addressStub: UIView = UIView()
  private(set) var addressShimmerView: ShimmeringView = ShimmeringView()
  
  private(set) var imageStub: UIView = UIView()
  private(set) var imageShimmerView: ShimmeringView = ShimmeringView()
  
  private(set) var descriptionStub: UIView = UIView()
  private(set) var descriptionShimmerView: ShimmeringView = ShimmeringView()
  
  private(set) var infoStack: UIView = UIView()
  
  private(set) var firstInfoStub: UIView = UIView()
  private(set) var firstInfoShimmerView: ShimmeringView = ShimmeringView()
  
  private(set) var secondInfoStub: UIView = UIView()
  private(set) var secondInfoShimmerView: ShimmeringView = ShimmeringView()
  
  // MARK: - Init
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  // MARK: - Functions
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    layout()
  }
  
  private func createUI() {
    
    container.addSubview <^> [
      priceShimmerView,
      addressShimmerView,
      imageShimmerView,
      descriptionShimmerView,
      infoStack
    ]
    
    infoStack.addSubview <^> [
      firstInfoShimmerView,
      secondInfoShimmerView
    ]
    
    addSubview <^> [
      container
    ]
  }
  
  private func configureUI() {
    priceStub.setStyles(
      UIView.Styles.stubBackground,
      UIView.Styles.cornerRadiusTiny
    )
    
    addressStub.setStyles(
      UIView.Styles.stubBackground,
      UIView.Styles.cornerRadiusTiny
    )
    
    imageStub.setStyles(
      UIView.Styles.stubBackground,
      UIView.Styles.cornerRadiusTiny
    )
    
    descriptionStub.setStyles(
      UIView.Styles.stubBackground,
      UIView.Styles.cornerRadiusTiny
    )
    
    firstInfoStub.setStyles(
      UIView.Styles.stubBackground,
      UIView.Styles.cornerRadiusTiny
    )
    
    secondInfoStub.setStyles(
      UIView.Styles.stubBackground,
      UIView.Styles.cornerRadiusTiny
    )
    
    priceShimmerView.contentView = priceStub
    priceShimmerView.setStyles(ShimmeringView.Styles.default)
    
    addressShimmerView.contentView = addressStub
    addressShimmerView.setStyles(ShimmeringView.Styles.default)
    
    imageShimmerView.contentView = imageStub
    imageShimmerView.setStyles(ShimmeringView.Styles.default)
    
    descriptionShimmerView.contentView = descriptionStub
    descriptionShimmerView.setStyles(ShimmeringView.Styles.default)
    
    firstInfoShimmerView.contentView = firstInfoStub
    firstInfoShimmerView.setStyles(ShimmeringView.Styles.default)
    
    secondInfoShimmerView.contentView = secondInfoStub
    secondInfoShimmerView.setStyles(ShimmeringView.Styles.default)
    
  }
  
  private func layout() {
    
    configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.flexDirection = .column
    }
    
    container.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.flexDirection = .column
      layout.paddingLeft = 16
      layout.paddingRight = 16
      layout.paddingTop = 12
      layout.paddingBottom = 8
    }
    
    priceShimmerView.configureLayout { (layout) in
      layout.isEnabled = true
      layout.width = 147
      layout.height = 20
      layout.marginBottom = 6
    }
    
    addressShimmerView.configureLayout { (layout) in
      layout.isEnabled = true
      layout.width = 200
      layout.height = 13
      layout.marginBottom = 13
    }
    
    imageShimmerView.configureLayout { (layout) in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 207
      layout.marginBottom = 8
    }
    
    descriptionShimmerView.configureLayout { (layout) in
      layout.isEnabled = true
      layout.width = 272
      layout.height = 13
      layout.marginBottom = 21
    }
    
    infoStack.configureLayout { (layout) in
      layout.isEnabled = true
      layout.flexDirection = .row
      layout.justifyContent = .spaceBetween
    }
    
    firstInfoShimmerView.configureLayout { (layout) in
      layout.isEnabled = true
      layout.width = 92
      layout.height = 10
    }
    
    secondInfoShimmerView.configureLayout { (layout) in
      layout.isEnabled = true
      layout.width = 107
      layout.height = 10
    }
    
    yoga.applyLayout(preservingOrigin: true)
  }
  
}
