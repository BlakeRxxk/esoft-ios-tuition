//
//  ObjectsSectionController.swift
//  ObjectsUI#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 28.05.2020.
//

import IGListKit
import EsoftUIKit

public protocol ObjectsSectionControllerOutput: class {
  //  func didTapSpecialist(in cell: SpecialistCellInput)
  //  func didTapPhone(in cell: SpecialistCellInput)
  //  func didTapChat(in cell: SpecialistCellInput)
}

public final class ObjectsSectionController: ListSectionController {
  private var object: ObjectsViewModel?
  weak var output: ObjectsSectionControllerOutput?
  
  public convenience init(output: ObjectsSectionControllerOutput?, inset: UIEdgeInsets? = nil) {
    self.init()
    self.output = output
    if let inset = inset {
      self.inset = inset
    }
  }
  
  override public init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
  }
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    let addressFont = UIFont.systemFont(ofSize: 13)
    let city = object!.city
    let district = object!.district
    let street = object!.street
    let house = object!.house
    let address = "\(city), \(district), \(street), \(house)"
    
    let addressHeight = CGFloat(address.height(width: width - 32, font: addressFont))
    
    var height: CGFloat = 0
    if addressHeight > 30 {
      height += 2
    }
    
    let calculateheight = 327 + addressHeight + height
    return CGSize(width: width, height: calculateheight)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: ObjectsCell.self,
                                                        for: self,
                                                        at: index) as? ObjectsCell else {
                                                          return UICollectionViewCell()
    }
    cell.output = self
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? ObjectsViewModel
  }
}

extension ObjectsSectionController: ObjectsCellOutput {
  
}

extension String {
  
  // расчитываем высоту в зависимости от размера шрифта
  func height(width: CGFloat, font: UIFont) -> CGFloat {
    let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
    
    let size = self.boundingRect(with: textSize,
                                 options: [.usesLineFragmentOrigin, .usesFontLeading],
                                 attributes: [NSAttributedString.Key.font: font],
                                 context: nil)
    return ceil(size.height)
  }
  
}
