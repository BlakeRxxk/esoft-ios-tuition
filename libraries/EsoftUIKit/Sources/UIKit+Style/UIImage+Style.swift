//
//  UIImage+Style.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

extension UIImage {
  public enum Filter {
    public static var base: UIImage {
      named("ic_sort").withRenderingMode(.alwaysTemplate)
    }
  }
  
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
    public enum Left {
      public static var base: UIImage {
        named("arrow.left.base").withRenderingMode(.alwaysTemplate)
      }
    }
  }

  public enum Favourites {
    public static var base: UIImage {
      named("star.base").withRenderingMode(.alwaysTemplate)
    }
  }

  public enum Share {
    public static var base: UIImage {
      named("share.base").withRenderingMode(.alwaysTemplate)
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

  public enum Bank {
    public enum Gazprombank {
      public static var base: UIImage {
        named("gazprombank").withRenderingMode(.alwaysOriginal)
      }
    }
  }
}
