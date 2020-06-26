//
//  DescEditingObjectItemViewIO.swift
//  EsoftUIKit
//
//  Created by wtildestar on 25/06/2020.
//

public protocol DescEditingObjectItemViewInput {
  var descLabel: String { get set }
}

public protocol DescEditingObjectItemViewOutput: AnyObject {
  func didTapEditDescription(in view: DescEditingObjectItemViewInput)
}
