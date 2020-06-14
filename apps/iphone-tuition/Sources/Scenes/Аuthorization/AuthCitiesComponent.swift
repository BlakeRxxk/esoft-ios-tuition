//
//  АuthCitiesComponent.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import NeedleFoundation
import Foundation
import AuthCore
import AuthImplementation
import AuthUI
import Network
import TuituionCore
import StorageKit

protocol AuthCitiesBuilder {
  var authCitiesViewController: UIViewController { get }
}

class AuthCitiesComponent: Component<EmptyDependency>, AuthCitiesBuilder {
  var networkService: NetworkAPI {
    let service = NetworkAPI(session: .init(.shared),
                             decoder: RiesDecoder(),
                             baseUrl: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/")!)
    service.requestInterceptors.append(RiesInterceptor())

    return service
  }
  
  var citiesGateway: CitiesGateway {
    shared {
      CitiesGatewayImplementation(networkService: networkService)
    }
  }
  
  var countriesGateway: CountriesGateway {
    shared {
      CountriesGatewayImplementation(networkService: networkService)
    }
  }
  
  var citiesStorage: CitiesStorage {
    let configuration = StorageConfiguration(type: .persistent)
    return CitiesStorageImplementation(inMemoryConfiguration: configuration)
  }
  
  var countriesStorage: CountriesStorage {
    let configuration = StorageConfiguration(type: .persistent)
    return CountriesStorageImplementation(inMemoryConfiguration: configuration)
  }
  
  var citiesRepository: CitiesRepository {
    shared {
      CitiesRepositoryImplementation(cityGateway: citiesGateway,
                                     citiesStorage: citiesStorage)
    }
  }
  
  var countriesRepository: CountriesRepository {
    shared {
      CountriesRepositoryImplementation(countryGateway: countriesGateway,
                                        countriesStorage: countriesStorage)
    }
  }
  
  var citiesUseCase: CitiesUseCase {
    shared {
      CitiesUseCaseImplementation(citiesRepository: citiesRepository)
    }
  }
  var countriesUseCase: CountriesUseCase {
    shared {
      CountriesUseCaseImplementation(countryRepository: countriesRepository)
    }
  }
  
  var state: CitiesListState {
    CitiesListState(citiesUseCase: citiesUseCase,
                    countriesUseCase: countriesUseCase)
  }
  
  var authCitiesViewController: UIViewController {
    let viewController = AuthUI.CitiesViewController()
    viewController.store = state
    
    return UINavigationController(rootViewController: viewController)
  }
}
