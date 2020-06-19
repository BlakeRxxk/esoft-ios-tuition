//
//  AuthCitiesViewController.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import UIKit
import BaseUI
import EsoftUIKit
import YogaKit
import RxSwift
import RxCocoa
import RxExtensions
import CoreLocation

final public class CitiesViewController: ViewController<BaseListView> {
  public var disposeBag: DisposeBag = DisposeBag()
  public let locationManager = CLLocationManager()
  
  let searchController = UISearchController(searchResultsController: nil)
  
  public init() {
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
  }
  
  override public func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.navigationBar.setStyles(UINavigationBar.Styles.modal)
    addLeftButtonIfNeeded(target: self, title: Localized.close, action: #selector(handleDismiss))
    navigationItem.title = Localized.city
    addInfoButtonIfNeeded(target: self, action: #selector(handleAlert))
    setupSearchController(searchController: searchController)
  }
  
  override public func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    view.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    specializedView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }
  
  private func configureUI() {
    locationManager.delegate = self
    
    specializedView.setStyles(UIView.Styles.defaultBackground)
  }
  
  @objc private func handleDismiss(sender: UIButton) {
//    dismiss(animated: true, completion: nil)
    self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
  }
  
  @objc private func handleAlert(sender: UIButton) {
    let alert = UIAlertController(title: "", message: Localized.info, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default) { [unowned self] _ in
      self.setNeedsStatusBarAppearanceUpdate()
    }
    alert.setStyles(UIAlertController.Styles.default)
    
    alert.addAction(action)
    
    present(alert, animated: true)
  }
}

extension CitiesViewController: CitiesSectionControllerOutput {
  public func didTap(in cell: CityCellInput) {
    store?.action.onNext(.selectCity(cell.cityId))
  }
}

extension CitiesViewController: MyCitySectionControllerOutput {
  public func myCitySectionDidTap() {
    if let myCity = store?.currentState.myCity {
      store?.action.onNext(.selectCity(Int(myCity.id)!))
    } else {
      var status = CLLocationManager.authorizationStatus()
      if status == .denied || status == .restricted || !CLLocationManager.locationServicesEnabled() {
        return
      }
      
      if status == .notDetermined {
        locationManager.requestWhenInUseAuthorization()
        status = CLLocationManager.authorizationStatus()
      }
      
      store?.action.onNext(.startLocating)
      locationManager.requestLocation()
    }
  }
}

extension CitiesViewController: CLLocationManagerDelegate {
  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else { return }
    
    store?.action.onNext(.changeMyCity(location.coordinate.latitude,
                                       location.coordinate.longitude))
  }
  
  public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error)
    store?.action.onNext(.stopLocating)
  }
}

extension CitiesViewController {
  enum Localized {
    public static let city = "Город"
    public static let close = "Закрыть"
    public static let location = "Ваше местоположение"
    public static let message = """
Это список городов присутствия компании “Этажи”.
Если Вашего города нет в списке,\
значит мы еще не открыли в нем офис, но возможно он появится в ближайшем будущем.
"""
    public static let info = """
Выберите офис компании “Этажи” в Вашем городе. Если города нет в списке, значит мы еще не открыли в нем офис, но возможно он появится в ближайшем будущем.
"""
  }
}
