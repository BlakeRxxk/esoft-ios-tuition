//
//  NeedleGenerated.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import AuthCore
import AuthImplementation
import AuthUI
import Foundation
import NeedleFoundation
import Network
import NetworkTrainee
import SpecialistsCore
import SpecialistsImplementation
import SpecialistsUI
import StorageKit
import TuituionCore

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->SellerTicketComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->LoggedOutComponent->PasswordComponent->AuthCitiesComponent") { component in
        return networkServiceDependencyf7009334ba99a847f4b0Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->LoggedOutComponent->PasswordComponent") { component in
        return networkServiceDependency7f4b9667802a4ca3962eProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->LoggedOutComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->ObjectsComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->DiscountComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->SpecialistsComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->CitiesComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->MortgageComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    
}

// MARK: - Providers

/// ^->RootComponent->LoggedOutComponent->PasswordComponent->AuthCitiesComponent
private class networkServiceDependencyf7009334ba99a847f4b0Provider: networkServiceDependency {
    var networkService: NetworkAPI {
        return loggedOutComponent.networkService
    }
    private let loggedOutComponent: LoggedOutComponent
    init(component: NeedleFoundation.Scope) {
        loggedOutComponent = component.parent.parent as! LoggedOutComponent
    }
}
/// ^->RootComponent->LoggedOutComponent->PasswordComponent
private class networkServiceDependency7f4b9667802a4ca3962eProvider: networkServiceDependency {
    var networkService: NetworkAPI {
        return loggedOutComponent.networkService
    }
    private let loggedOutComponent: LoggedOutComponent
    init(component: NeedleFoundation.Scope) {
        loggedOutComponent = component.parent as! LoggedOutComponent
    }
}
