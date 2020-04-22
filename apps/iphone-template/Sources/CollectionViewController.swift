//
//  CollectionViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import YogaKit

final class CollectionViewController: UIViewController {
  private(set) lazy var layoutFlow: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
  private(set) lazy var collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                                            collectionViewLayout: layoutFlow)
  
  var customData: [String] = [
    "string 1",
    "string 2",
    "string 3"
  ]

  override func loadView() {
    view = UIView()
    
    createUI()
    configureUI()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    let container = view.bounds
    view.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    collectionView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [weak self] in
      self?.update()
    }
  }

  private func createUI() {
    view.addSubview(collectionView)
  }
  
  private func configureUI() {
    view.backgroundColor = Theme.colors.container
    collectionView.backgroundColor = Theme.colors.container
    collectionView.register(AwesomeCell.self, forCellWithReuseIdentifier: AwesomeCell.reuseIdentifier)
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
    layoutFlow.scrollDirection = .horizontal
    layoutFlow.minimumLineSpacing = 0
    layoutFlow.minimumInteritemSpacing = 0
    
    collectionView.isPagingEnabled = true
  }

  func update() {
    customData.append("string 4")
    collectionView.performBatchUpdates({
      let index = IndexPath(item: 3, section: 0)
      
      collectionView.insertItems(at: [index])
    })
  }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: 500)
  }
}

extension CollectionViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return customData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView
      .dequeueReusableCell(withReuseIdentifier: AwesomeCell.reuseIdentifier,
                           for: indexPath) as? AwesomeCell else {
      return UICollectionViewCell()
    }
    
    cell.textLabel.styledText = customData[indexPath[1]]
    
    if indexPath[1] % 2 == 1 {
      cell.contentView.backgroundColor = .systemPink
    } else {
      cell.contentView.backgroundColor = .systemTeal
    }

    return cell
  }
}


