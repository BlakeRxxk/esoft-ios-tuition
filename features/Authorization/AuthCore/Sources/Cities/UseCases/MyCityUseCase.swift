//
//  MyCityUseCase.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 16.06.2020.
//

import RxSwift

public protocol MyCityUseCase {
  func invoke(request: MyCityRequest) -> Observable<MyCity>
}
