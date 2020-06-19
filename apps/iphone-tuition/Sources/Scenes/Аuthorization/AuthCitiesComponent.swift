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

class AuthCitiesComponent: Component<networkServiceDependency>, AuthUI.CitiesBuilder {
  var citiesGateway: CitiesGateway {
    shared {
      CitiesGatewayImplementation(networkService: dependency.networkService)
    }
  }
  var countriesGateway: CountriesGateway {
    shared {
      CountriesGatewayImplementation(networkService: dependency.networkService)
    }
  }
  var myCityGateway: MyCityGateway {
    shared {
      MyCityGatewayImplementation(networkService: dependency.networkService)
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
  var myCityStorage: MyCityStorage {
    let configuration = StorageConfiguration(type: .inmemory)
    return MyCityStorageImplementation(inMemoryConfiguration: configuration)
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
  var myCityRepository: MyCityRepository {
    shared {
      MyCityRepositoryImplementation(myCityGateway: myCityGateway,
                                     myCityStorage: myCityStorage)
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
  var myCityUseCase: MyCityUseCase {
    shared {
      MyCityUseCaseImplementation(myCityRepository: myCityRepository)
    }
  }
  
  var state: CitiesListState {
    CitiesListState(citiesUseCase: citiesUseCase,
                    countriesUseCase: countriesUseCase,
                    myCityUseCase: myCityUseCase)
  }
  
  var citiesViewController: UIViewController {
    let viewController = AuthUI.CitiesViewController()
    viewController.store = state
    
    return UINavigationController(rootViewController: viewController)
  }
}
