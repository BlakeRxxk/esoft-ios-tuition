//
//  ObjectsRepositoryImplementation.swift
//  ObjectsImplementation#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 27.05.2020.
//

import RxSwift
import Network
import ObjectsCore

public final class ObjectsRepositoryImplementation {
  private var objectsGateway: ObjectsGateway
  
  public init(objectsGateway: ObjectsGateway) {
    self.objectsGateway = objectsGateway
  }
}

extension ObjectsRepositoryImplementation: ObjectsRepository {
    
    public func getObjects() -> Single<[Object]> {
        objectsGateway.getObjects(url: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/objects")!)
    }
  
}
