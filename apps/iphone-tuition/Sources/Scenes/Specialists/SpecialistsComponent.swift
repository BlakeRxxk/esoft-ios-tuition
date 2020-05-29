//
//  RxDemoComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation
import SpecialistsCore
import SpecialistsImplementation
import SpecialistsUI
import Network

protocol SpecialistsBuilder {
  var viewController: UIViewController { get }
}

class SpecialistsComponent: Component<EmptyDependency>, SpecialistsBuilder {
  var useCase: SpecialistsUseCase {
    shared {
      SpecialistsUseCaseImplementation(specialistRepository: repository)
    }
  }
  
  var repository: SpecialistsRepository {
    shared {
      SpecialistsRepositoryImplementation(specialistGateway: gateway)
    }
  }
  
  var networkService: NetworkAPI {
    let service = NetworkAPI(session: .init(.shared),
                             decoder: RiesDecoder(),
                             baseUrl: URL(string: "https://developers.etagi.com/api/v2/catalogs")!)
    service.requestInterceptors.append(RiesInterceptor())

    return service
  }
  
  var gateway: SpecialistsGateway {
    shared {
      SpecialistsGatewayImplementation(networkService: networkService)
    }
  }
  
  var state: SpecialistsListState {
    SpecialistsListState(specialistsUseCase: useCase)
  }
  
  var viewController: UIViewController {
    let viewController = SpecialistsList()
    viewController.store = state
    
    return viewController
  }
}

final class RiesInterceptor: NetworkAPIRequestInterceptor {
  private let apiKey: String
  private let keyName: String = "API_KEY"
  
  init() {
    self.apiKey = "demo_lk_ios"
  }

  func intercept(_ request: URLRequest) -> URLRequest {
    var urlComponents = URLComponents(string: request.url?.absoluteString ?? "")
    let queryItem: URLQueryItem = URLQueryItem(name: keyName.lowercased(), value: apiKey)

    if urlComponents?.queryItems != nil {
      urlComponents?.queryItems?.append(queryItem)
    } else {
      urlComponents?.queryItems = [queryItem]
    }

    if let url = urlComponents?.url {
      var innerRequest = URLRequest(url: url)

      innerRequest.httpMethod = request.httpMethod
      innerRequest.httpBody = request.httpBody

      if let headers = request.allHTTPHeaderFields {
        headers.forEach { innerRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
      }

      return innerRequest
    } else {
      return request
    }
  }
}

public final class RiesDecoder: NetworkAPIDecoder {
  public func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable {
    let responseData = try JSONDecoder().decode(Response<T>.self, from: data)

    return responseData.data!
  }
}
