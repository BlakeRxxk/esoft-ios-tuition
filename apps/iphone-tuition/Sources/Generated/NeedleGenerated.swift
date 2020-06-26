//
//  NeedleGenerated.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import NeedleFoundation
import Network
import NetworkTrainee
import SellerTicketCore
import SellerTicketImplementation
import SellerTicketUI
import SpecialistsCore
import SpecialistsImplementation
import SpecialistsUI
import StorageKit
import TuitionIntegrations
import TuituionCore
import UIKit

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->ObjectsComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->DiscountComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->SpecialistsComponent") { component in
        return SpecialistsDependencycb6f331f5dba1fb5be1cProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->SpecialistsComponent->SpecialistDetailsComponent") { component in
        return SpecialistDetailsDependency55a87ea8ae56ad46ed8eProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->SpecialistsComponent->SpecialistsListComponent") { component in
        return SpecialistsListDependencye5972927265805e7507fProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->RxSellerTicketComponent->EditDescriptionComponent") { component in
        return EditDescriptionDependencyed1b16cf292862e4289eProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->RxSellerTicketComponent->EditSellerPriceComponent") { component in
        return EditSellerPriceDependencyb1b934c991e2a0f10123Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->RxSellerTicketComponent->SellerTicketListComponent") { component in
        return SellerTicketListDependency1e6c9804dd2fc47be796Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->RxSellerTicketComponent") { component in
        return RxSellerTicketDependencycde53cf4b263c4b8d3a4Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->CitiesComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->MortgageComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->LoggedOutComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    
}

// MARK: - Providers

/// ^->RootComponent->SpecialistsComponent
private class SpecialistsDependencycb6f331f5dba1fb5be1cProvider: SpecialistsDependency {
    var rootNavigator: UINavigationController {
        return rootComponent.rootNavigator
    }
    var networkService: NetworkAPIProtocol {
        return rootComponent.networkService
    }
    private let rootComponent: RootComponent
    init(component: NeedleFoundation.Scope) {
        rootComponent = component.parent as! RootComponent
    }
}
/// ^->RootComponent->SpecialistsComponent->SpecialistDetailsComponent
private class SpecialistDetailsDependency55a87ea8ae56ad46ed8eProvider: SpecialistDetailsDependency {
    var useCase: SpecialistsUseCase {
        return specialistsComponent.useCase
    }
    private let specialistsComponent: SpecialistsComponent
    init(component: NeedleFoundation.Scope) {
        specialistsComponent = component.parent as! SpecialistsComponent
    }
}
/// ^->RootComponent->SpecialistsComponent->SpecialistsListComponent
private class SpecialistsListDependencye5972927265805e7507fProvider: SpecialistsListDependency {
    var useCase: SpecialistsUseCase {
        return specialistsComponent.useCase
    }
    var router: SpecialistsRouter {
        return specialistsComponent.router
    }
    private let specialistsComponent: SpecialistsComponent
    init(component: NeedleFoundation.Scope) {
        specialistsComponent = component.parent as! SpecialistsComponent
    }
}
/// ^->RootComponent->RxSellerTicketComponent->EditDescriptionComponent
private class EditDescriptionDependencyed1b16cf292862e4289eProvider: EditDescriptionDependency {
    var useCase: SellerTicketUseCase {
        return rxSellerTicketComponent.useCase
    }
    private let rxSellerTicketComponent: RxSellerTicketComponent
    init(component: NeedleFoundation.Scope) {
        rxSellerTicketComponent = component.parent as! RxSellerTicketComponent
    }
}
/// ^->RootComponent->RxSellerTicketComponent->EditSellerPriceComponent
private class EditSellerPriceDependencyb1b934c991e2a0f10123Provider: EditSellerPriceDependency {
    var useCase: SellerTicketUseCase {
        return rxSellerTicketComponent.useCase
    }
    private let rxSellerTicketComponent: RxSellerTicketComponent
    init(component: NeedleFoundation.Scope) {
        rxSellerTicketComponent = component.parent as! RxSellerTicketComponent
    }
}
/// ^->RootComponent->RxSellerTicketComponent->SellerTicketListComponent
private class SellerTicketListDependency1e6c9804dd2fc47be796Provider: SellerTicketListDependency {
    var useCase: SellerTicketUseCase {
        return rxSellerTicketComponent.useCase
    }
    var router: SellerTicketRouter {
        return rxSellerTicketComponent.router
    }
    private let rxSellerTicketComponent: RxSellerTicketComponent
    init(component: NeedleFoundation.Scope) {
        rxSellerTicketComponent = component.parent as! RxSellerTicketComponent
    }
}
/// ^->RootComponent->RxSellerTicketComponent
private class RxSellerTicketDependencycde53cf4b263c4b8d3a4Provider: RxSellerTicketDependency {
    var rootNavigator: UINavigationController {
        return rootComponent.rootNavigator
    }
    var networkService: NetworkAPIProtocol {
        return rootComponent.networkService
    }
    private let rootComponent: RootComponent
    init(component: NeedleFoundation.Scope) {
        rootComponent = component.parent as! RootComponent
    }
}
