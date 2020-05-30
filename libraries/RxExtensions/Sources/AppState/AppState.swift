//
//  AppState.swift
//  RxExtensions
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public enum AppState: Equatable {
  /**
   The application is running in the foreground.
   */
  case active
  /**
   The application is running in the foreground but not receiving events.
   Possible reasons:
   - The user has opens Notification Center or Control Center
   - The user receives a phone call
   - A system prompt is shown (e.g. Request to allow Push Notifications)
   */
  case inactive
  /**
   The application is in the background because the user closed it.
   */
  case background
  /**
   The application is about to be terminated by the system
   */
  case terminated
}
