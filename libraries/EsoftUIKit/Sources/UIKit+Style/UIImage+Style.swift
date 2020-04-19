//
//  UIImage+Style.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

extension UIImage {
  public enum Call {
    public static var left: UIImage {
      named("call.left.base").withRenderingMode(.alwaysTemplate)
    }
    
    public static var right: UIImage {
      named("call.right.base").withRenderingMode(.alwaysTemplate)
    }
  }
  
  public enum Consultant {
    public static var left: UIImage {
      named("consultant.base").withRenderingMode(.alwaysTemplate)
    }
  }
    
  public enum Screen5 {
    public static var edit: UIImage {
      named("edit").withRenderingMode(.alwaysTemplate)
    }
    
    public static var go: UIImage {
      named("go").withRenderingMode(.alwaysTemplate)
    }
  }
  
  public enum Arrow {
    public enum Right {
      public static var base: UIImage {
        named("arrow.right.base").withRenderingMode(.alwaysTemplate)
      }
      public static var small: UIImage {
        named("arrow.right.small").withRenderingMode(.alwaysTemplate)
      }
    }
  }
}
