//
//  RxKeyboard.swift
//  RxExtensions
//
//  Copyright © 2018 E-SOFT. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

public class RxKeyboard: NSObject, RxKeyboardType {
  public static let instance = RxKeyboard()
  
  public let frame: Driver<CGRect>
  public let visibleHeight: Driver<CGFloat>
  public let willShowVisibleHeight: Driver<CGFloat>
  public let willHideVisibleHeight: Driver<CGFloat>
  
  public let isHidden: Driver<Bool>
  public let panRecognizer = UIPanGestureRecognizer()
  private let disposeBag = DisposeBag()
  
  override init() {
    let keyboardWillChangeFrame = UIResponder.keyboardWillChangeFrameNotification
    let keyboardWillHide = UIResponder.keyboardWillHideNotification
    let keyboardFrameEndKey = UIResponder.keyboardFrameEndUserInfoKey
    let applicationDidFinishLaunching = UIApplication.didFinishLaunchingNotification
    let defaultFrame = CGRect(
      x: 0,
      y: UIScreen.main.bounds.height,
      width: UIScreen.main.bounds.width,
      height: 0
    )
    let frameVariable = BehaviorRelay<CGRect>(value: defaultFrame)
    
    frame = frameVariable.asDriver().distinctUntilChanged()
    visibleHeight = frame.map { UIScreen.main.bounds.height - $0.origin.y }
    
    willShowVisibleHeight = visibleHeight
      .scan((visibleHeight: 0, isShowing: false)) { lastState, newVisibleHeight in
        (visibleHeight: newVisibleHeight,
         isShowing: lastState.visibleHeight == 0 && newVisibleHeight > 0)
    }
    .filter { state in state.isShowing }
    .map { state in state.visibleHeight }
    
    willHideVisibleHeight = visibleHeight
      .filter { $0 == 0}
      .skip(1)
    
    isHidden = visibleHeight.map({ $0 == 0.0 }).distinctUntilChanged()
    
    super.init()
    
    // keyboard will change frame
    let willChangeFrame = NotificationCenter.default.rx
      .notification(keyboardWillChangeFrame)
      .map { notification -> CGRect in
        let rectValue = notification.userInfo?[keyboardFrameEndKey] as? NSValue
        return rectValue?.cgRectValue ?? defaultFrame
    }
    .map { frame -> CGRect in
      if frame.origin.y < 0 { // if went to wrong frame
        var newFrame = frame
        newFrame.origin.y = UIScreen.main.bounds.height - newFrame.height
        return newFrame
      }
      return frame
    }
    // keyboard will hide
    let willHide = NotificationCenter.default.rx
      .notification(keyboardWillHide)
      .map { notification -> CGRect in
        let rectValue = notification.userInfo?[keyboardFrameEndKey] as? NSValue
        return rectValue?.cgRectValue ?? defaultFrame
    }
    .map { frame -> CGRect in
      if frame.origin.y < 0 { // if went to wrong frame
        var newFrame = frame
        newFrame.origin.y = UIScreen.main.bounds.height
        return newFrame
      }
      return frame
    }
    
    // pan gesture
    let didPan = panRecognizer.rx.event
      .withLatestFrom(frameVariable.asObservable()) { ($0, $1) }
      .flatMap { (gestureRecognizer, frame) -> Observable<CGRect> in
        guard case .changed = gestureRecognizer.state,
          let window = UIApplication.shared.windows.first,
          frame.origin.y < UIScreen.main.bounds.height
          else { return .empty() }
        let origin = gestureRecognizer.location(in: window)
        var newFrame = frame
        newFrame.origin.y = max(origin.y, UIScreen.main.bounds.height - frame.height)
        return .just(newFrame)
    }
    
    // merge into single sequence
    Observable.of(didPan, willChangeFrame, willHide)
      .merge()
      .bind(to: frameVariable)
      .disposed(by: disposeBag)
    
    // gesture recognizer
    self.panRecognizer.delegate = self
    NotificationCenter.default.rx
      .notification(applicationDidFinishLaunching)
      .map { _ in Void() }
      .startWith(Void()) // when RxKeyboard is initialized before UIApplication.window is created
      .subscribe(onNext: { [weak self] _ in
        guard let `self` = self else { return }
        UIApplication.shared.windows.first?.addGestureRecognizer(self.panRecognizer)
      })
      .disposed(by: disposeBag)
  }
}
