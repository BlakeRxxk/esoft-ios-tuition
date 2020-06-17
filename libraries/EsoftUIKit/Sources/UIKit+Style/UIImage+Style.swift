//
//  UIImage+Style.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//
import UIKit

extension UIImage {
  public enum Stub {
    public static var specialists: UIImage {
      named("stub.specialists").withRenderingMode(.alwaysTemplate)
    }
    
    public static var favorites: UIImage {
      named("stub.favorites").withRenderingMode(.alwaysTemplate)
    }
    
    public static var tickets: UIImage {
      named("stub.tickets").withRenderingMode(.alwaysTemplate)
    }
    
    public static var search: UIImage {
      named("stub.search").withRenderingMode(.alwaysTemplate)
    }
    
    public static var chat: UIImage {
      named("stub.chat").withRenderingMode(.alwaysTemplate)
    }
  }
  
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
    public static var base: UIImage {
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
  
  public enum Geo {
    public static var base: UIImage {
      named("geo.base").withRenderingMode(.alwaysTemplate)
    }
  }
  
  public enum Spinner {
    public static var base: UIImage {
      named("spinner").withRenderingMode(.alwaysTemplate)
    }
  }

  public enum Info {
    public static var base: UIImage {
      named("info").withRenderingMode(.alwaysTemplate)
    }
  }
  
  public enum Check {
    public static var base: UIImage {
      named("check")
    }
  }
  
  public static var arrowDown: UIImage {
    named("arrow.down").withRenderingMode(.alwaysTemplate)
  }
  
  public static var eye: UIImage {
    named("eye.regular").withRenderingMode(.alwaysTemplate)
  }
  
  public static var eyeSolid: UIImage {
    named("eye.solid").withRenderingMode(.alwaysTemplate)
  }
  
  public static var starSmall: UIImage {
    named("star.small").withRenderingMode(.alwaysTemplate)
  }
  
  public static var favorit: UIImage {
    named("favorit").withRenderingMode(.alwaysTemplate)
  }
}
