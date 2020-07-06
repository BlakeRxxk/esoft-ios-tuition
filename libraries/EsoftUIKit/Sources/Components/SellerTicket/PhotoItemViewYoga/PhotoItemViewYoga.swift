//
//  PhotoItemViewYoga.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by wtildestar on 26/04/2020.
//

import UIKit
import BaseUI
import BaseFRP
import ThemeManager
import AutoLayoutKit

public final class PhotoItemViewYoga: View {
  public var dataSet: [String] {
    get {
      dataSet
    }
    set {
      data = newValue
      collectionView.reloadData()
    }
  }
  
  private(set) lazy var photoSubheaderTitle: UILabel = UILabel()
  private(set) lazy var photoContainer: UIView = UIView()
  private(set) lazy var showAllStackView: UIView = UIView()
  private(set) lazy var showAllLabel: UILabel = UILabel()
  private(set) lazy var showAllQuantityStackView: UIView = UIView()
  private(set) lazy var showAllQuantityLabel: UILabel = UILabel()
  private(set) lazy var arrowImage: UIImageView = UIImageView()
  private(set) lazy var imageArr: [UIImage] = [UIImage]()
  private(set) lazy var mainContainer: UIView = UIView()
  private(set) lazy var data: [String] = []
  private(set) lazy var collectionView: UICollectionView = {
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    let cv: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.isScrollEnabled = false
    cv.register(PhotoCollectionViewCellYoga.self, forCellWithReuseIdentifier: PhotoCollectionViewCellYoga.reuseId)
    return cv
  }()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
    layout()
  }
  
  private func createUI() {
    let subviews: [UIView] = [
      mainContainer,
      photoSubheaderTitle,
      photoContainer,
      collectionView,
      showAllStackView,
      showAllLabel,
      showAllQuantityStackView,
      showAllQuantityLabel,
      arrowImage
    ]
    
    subviews.forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    mainContainer.addSubview(photoSubheaderTitle)
    mainContainer.addSubview(photoContainer)
    
    photoContainer.addSubview(collectionView)
    photoContainer.addSubview(showAllStackView)
    showAllStackView.addSubview(showAllLabel)
    showAllStackView.addSubview(showAllQuantityStackView)
    showAllQuantityStackView.addSubview(showAllQuantityLabel)
    showAllQuantityStackView.addSubview(arrowImage)
    
    addSubview <^> [
      mainContainer
    ]
  }
  
  private func configureUI() {
    collectionView.delegate = self
    collectionView.dataSource = self
    
    photoSubheaderTitle.text = Localized.photoSubheaderTitle
    photoSubheaderTitle.setStyles(
      UILabel.Styles.small,
      UILabel.ColorStyle.secondary
    )
    
    photoContainer.backgroundColor = ThemeManager.current().colors.container
    
    collectionView.backgroundColor = .clear
    
    showAllLabel.text = Localized.showAllLabel
    showAllLabel.setStyles(UILabel.Styles.regular, UILabel.ColorStyle.primary)
    
    showAllQuantityLabel.text = Localized.showAllQuantityLabel
    showAllQuantityLabel.setStyles(UILabel.Styles.regular, UILabel.ColorStyle.primary)
    
    arrowImage.image = UIImage.Screen5.go
  }
  
  private func layout() {
    mainContainer.configureLayout { layout in
      layout.isEnabled = true
    }
    
    photoSubheaderTitle.configureLayout { layout in
      layout.isEnabled = true
      layout.marginTop = 20
      layout.marginHorizontal = 16
    }
    
    photoContainer.configureLayout { layout in
      layout.isEnabled = true
      layout.marginTop = 8
      layout.flexDirection = .column
    }
    
    collectionView.configureLayout { layout in
      layout.isEnabled = true
      layout.marginTop = 8
      layout.height = 184
    }
    
    showAllStackView.configureLayout { layout in
      layout.isEnabled = true
      layout.marginHorizontal = 16
      layout.flexDirection = .row
      layout.justifyContent = .spaceBetween
    }
    
    showAllLabel.configureLayout { layout in
      layout.isEnabled = true
      layout.marginVertical = 13
    }
    
    showAllQuantityStackView.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
      layout.justifyContent = .spaceBetween
    }
    
    showAllQuantityLabel.configureLayout { layout in
      layout.isEnabled = true
      layout.marginVertical = 13
      layout.marginRight = 16
    }
    
    arrowImage.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 24
      layout.marginVertical = 12
    }
  }
}

extension PhotoItemViewYoga: PhotoItemViewYogaInput {}

extension PhotoItemViewYoga {
  enum Localized {
    public static let photoSubheaderTitle = "Фотографии"
    public static let showAllLabel = "Показать все"
    public static let showAllQuantityLabel = "123"
  }
}

extension PhotoItemViewYoga: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: 80, height: 80)
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             numberOfItemsInSection section: Int) -> Int {
    data.count
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCellYoga.reuseId,
                                                  for: indexPath) as! PhotoCollectionViewCellYoga
    cell.set(photoName: data[indexPath.row])
    return cell
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    CGFloat(0)
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    CGFloat(8)
  }
}
