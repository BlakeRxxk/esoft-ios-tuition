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
  
  public enum Logo {
    public static var base: UIImage {
      named("logo.base").withRenderingMode(.alwaysTemplate)
    }
    public static var small: UIImage {
      named("logo.small").withRenderingMode(.alwaysTemplate)
    }
  }

  public enum Close {
    public static var base: UIImage {
      named("close.base").withRenderingMode(.alwaysTemplate)
    }
  }
  
  public enum Socials {
    public static var facebook: UIImage {
      named("facebook")
    }
    public static var vk: UIImage {
      named("vk")
    }
    public static var ok: UIImage {
      named("ok")
    }
    public static var google: UIImage {
      named("google")
    }
  }
}
