//
//  ViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import EsoftUIKit
import ThemeManager
import AutoLayoutKit

final class ViewController: UIViewController {
  
  // MARK: - Outlets
  private(set) lazy var costItemView: CostItemView = CostItemView()
  private(set) lazy var photoSubheader: UILabel = UILabel()
  private(set) lazy var photoContainer: UIView = UIView()
  private(set) lazy var showAllLabel: UILabel = UILabel()
  private(set) lazy var showAllStackView: UIStackView = UIStackView()
  private(set) lazy var showAllQuantityStackView: UIStackView = UIStackView()
  private(set) lazy var showAllQuantityLabel: UILabel = UILabel()
  private(set) lazy var arrowImage: UIImageView = UIImageView()
  
  let collectionView: UICollectionView = {
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    let cv: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.isScrollEnabled = false
    cv.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.reuseId)
    return cv
  }()
  
  fileprivate let data = [
    PhotoData(title: "1", backgroundImage: UIImage(named: "0")!),
    PhotoData(title: "2", backgroundImage: UIImage(named: "2")!),
    PhotoData(title: "3", backgroundImage: UIImage(named: "3")!),
    PhotoData(title: "4", backgroundImage: UIImage(named: "3")!),
    PhotoData(title: "5", backgroundImage: UIImage(named: "3")!),
    PhotoData(title: "6", backgroundImage: UIImage(named: "5")!),
    PhotoData(title: "7", backgroundImage: UIImage(named: "7")!),
    PhotoData(title: "8", backgroundImage: UIImage(named: "7")!)
  ]
  
  // MARK: - View Controller
  override func loadView() {
    view = UIView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
    createUI()
    configureUI()
    layout()
  }
  
  // MARK: - Methods
  private func createUI() {
    view.addSubview(costItemView)
    
    view.addSubview(photoSubheader)
    view.addSubview(photoContainer)
    photoContainer.addSubview(collectionView)
    photoContainer.addSubview(showAllStackView)
    showAllStackView.addArrangedSubview(showAllLabel)
    showAllStackView.addArrangedSubview(showAllQuantityStackView)
    showAllQuantityStackView.addArrangedSubview(showAllQuantityLabel)
    showAllQuantityStackView.addArrangedSubview(arrowImage)
  }
  
  private func configureUI() {
    view.backgroundColor = AppTheme.current().colors.screen
    
    navigationItem.title = Localized.title
    let nav = self.navigationController?.navigationBar
    nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    nav?.barTintColor = AppTheme.current().colors.defaultTopBar
    
    costItemView.subheader = Localized.costSubheader
    costItemView.firstTitle = Localized.costLabel
    costItemView.secondTitle = Localized.noticeLabel
    costItemView.thirdTitle = Localized.editLabel
    
    photoSubheader.text = Localized.photoSubheader
    photoSubheader.setStyles(
      UILabel.Styles.small,
      UILabel.ColorStyle.secondary
    )
    
    photoContainer.backgroundColor = AppTheme.current().colors.container
    collectionView.backgroundColor = .clear
    
    showAllLabel.text = Localized.showAllLabel
    showAllLabel.setStyles(UILabel.Styles.regular, UILabel.ColorStyle.primary)
    
    showAllQuantityLabel.text = Localized.showAllQuantityLabel
    showAllQuantityLabel.setStyles(UILabel.Styles.regular, UILabel.ColorStyle.primary)
    
    showAllStackView.alignment = .center
    
    showAllQuantityStackView.alignment = .center
    showAllQuantityStackView.spacing = 16
    
    arrowImage.image = UIImage.Screen5.go
  }
  
  private func layout() {
    [
      costItemView,
      photoSubheader,
      photoContainer,
      collectionView,
      showAllStackView,
      showAllLabel,
      showAllQuantityStackView,
      showAllQuantityLabel,
      arrowImage
      ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    
    let margins = view.layoutMarginsGuide
    
    // MARK: - Constraints
    let constraints = [
      costItemView.topAnchor.constraint(equalTo: margins.topAnchor),
      costItemView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      costItemView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      photoSubheader.top.constraint(equalTo: costItemView.bottom, constant: 20),
      photoSubheader.leading.constraint(equalTo: view.leading, constant: 16),
      photoSubheader.trailing.constraint(equalTo: view.trailing, constant: 16),
      
      photoContainer.top.constraint(equalTo: photoSubheader.bottom, constant: 8),
      photoContainer.leading.constraint(equalTo: view.leading),
      photoContainer.trailing.constraint(equalTo: view.trailing),
      
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
    
    NSLayoutConstraint.activate(constraints)
  }
}

private extension ViewController {
  enum Localized {
    static let title = "Title"
    static let costSubheader = "Стоимость объекта"
    static let costLabel = "700 500 000 руб."
    static let noticeLabel = "Выше рыночной на 90%"
    static let editLabel = "Изменить"
    static let photoSubheader = "Фотографии"
    static let showAllLabel = "Показать все"
    static let showAllQuantityLabel = "123"
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 80, height: 80)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseId, for: indexPath) as! PhotoCollectionViewCell
    cell.data = self.data[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return CGFloat(0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return CGFloat(8)
  }
}
