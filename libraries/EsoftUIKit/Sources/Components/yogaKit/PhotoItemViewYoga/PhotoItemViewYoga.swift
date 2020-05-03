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
  public var subheader: String {
    get {
      photoSubheader.styledText ?? ""
    }
    set {
      photoSubheader.styledText = newValue
    }
  }
  
  public var dataSet: [String] {
    get {
      dataSet
    }
    set {
      data = newValue
      collectionView.reloadData()
    }
  }
  
  public var firstTitle: String {
    get {
      showAllLabel.styledText ?? ""
    }
    set {
      showAllLabel.styledText = newValue
    }
  }
  
  public var secondTitle: String {
    get {
      showAllQuantityLabel.styledText ?? ""
    }
    set {
      showAllQuantityLabel.styledText = newValue
    }
  }
  
  public var icon: UIImage? {
    get {
      arrowImage.image
    }
    set {
      arrowImage.image = newValue ?? UIImage()
    }
  }
  
  private(set) lazy var photoSubheader: UILabel = UILabel()
  private(set) lazy var photoContainer: UIView = UIView()
  private(set) lazy var showAllStackView: UIStackView = UIStackView()
  private(set) lazy var showAllLabel: UILabel = UILabel()
  private(set) lazy var showAllQuantityStackView: UIStackView = UIStackView()
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
  private var activeConstraints: [NSLayoutConstraint] = []
  override public init() {
    super.init()
    
    createUI()
    configureUI()
    layout()
  }
  
  private func createUI() {
    let subviews: [UIView] = [
      mainContainer,
      photoSubheader,
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
    
    mainContainer.addSubview(photoSubheader)
    mainContainer.addSubview(photoContainer)
    
    photoContainer.addSubview(collectionView)
    photoContainer.addSubview(showAllStackView)
    showAllStackView.addArrangedSubview(showAllLabel)
    showAllStackView.addArrangedSubview(showAllQuantityStackView)
    showAllQuantityStackView.addArrangedSubview(showAllQuantityLabel)
    showAllQuantityStackView.addArrangedSubview(arrowImage)
    
    addSubview <^> [
      mainContainer
    ]
  }
  
  private func configureUI() {
    collectionView.delegate = self
    collectionView.dataSource = self
    
    photoSubheader.setStyles(
      UILabel.Styles.small,
      UILabel.ColorStyle.secondary
    )
    
    photoContainer.backgroundColor = ThemeManager.current().colors.container
    
    collectionView.backgroundColor = .clear
    
    showAllLabel.setStyles(UILabel.Styles.regular, UILabel.ColorStyle.primary)
    
    showAllQuantityLabel.setStyles(UILabel.Styles.regular, UILabel.ColorStyle.primary)
    
    showAllStackView.alignment = .center
    
    showAllQuantityStackView.alignment = .center
    showAllQuantityStackView.spacing = 16
    
    arrowImage.image = UIImage.Screen5.go
  }
  
  private func layout() {
    activeConstraints = [
      mainContainer.top.constraint(equalTo: top),
      mainContainer.leading.constraint(equalTo: leading),
      mainContainer.trailing.constraint(equalTo: trailing),
      mainContainer.bottom.constraint(equalTo: bottom),
      
      photoSubheader.top.constraint(equalTo: mainContainer.top, constant: 20),
      photoSubheader.leading.constraint(equalTo: mainContainer.leading, constant: 16),
      photoSubheader.trailing.constraint(equalTo: mainContainer.trailing, constant: 16),
      
      photoContainer.top.constraint(equalTo: photoSubheader.bottom, constant: 8),
      photoContainer.leading.constraint(equalTo: mainContainer.leading),
      photoContainer.trailing.constraint(equalTo: mainContainer.trailing),
      photoContainer.bottom.constraint(equalTo: mainContainer.bottom),
      
      collectionView.top.constraint(equalTo: photoContainer.top),
      collectionView.leading.constraint(equalTo: photoContainer.leading),
      collectionView.trailing.constraint(equalTo: photoContainer.trailing),
      collectionView.heightAnchor.constraint(equalToConstant: 184),
      
      showAllStackView.top.constraint(equalTo: collectionView.bottom),
      showAllStackView.leading.constraint(equalTo: photoContainer.leading, constant: 16),
      showAllStackView.trailing.constraint(equalTo: photoContainer.trailing, constant: -16),
      showAllStackView.bottom.constraint(equalTo: photoContainer.bottom),
      
      showAllLabel.top.constraint(equalTo: showAllStackView.top, constant: 13),
      showAllLabel.bottom.constraint(equalTo: showAllStackView.bottom, constant: -13),
      showAllLabel.leading.constraint(equalTo: showAllStackView.leading),
      
      showAllQuantityLabel.centerYAnchor.constraint(equalTo: showAllLabel.centerYAnchor),
      
      arrowImage.heightAnchor.constraint(equalToConstant: 24),
      arrowImage.widthAnchor.constraint(equalToConstant: 24)
    ]
    
    NSLayoutConstraint.activate(activeConstraints)
  }
}

extension PhotoItemViewYoga: PhotoItemViewInput {}

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
    cell.set(index: data[indexPath.row])
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
