//
//  ImageLinkBuilder.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

enum CDNImageTypes: String {
  case typeStatic = "static"
  case media
  case mediaLK = "media/lk"
  case mediaGallery = "media/gallery"
  case mediaSite = "media/site"
  case mediaRIESUploadsDocuments = "media/ries_uploads_documents"
  case photos
  case layouts
  case type3DTours = "3d_tours"
  case type3DToursNew = "3d_tours_new"
  case profile
  case attach
  case commerceLayouts = "commerce_layouts"
  case newhouses
  case noPhoto = "no_photo"
  case builders
  case banks
}

enum CDNImageSizes: String {
  case crop50x50 = "5050"
  case crop100x100 = "100100"
  case crop100x150 = "100150"
  case crop128x128 = "128128"
  case crop150x150 = "150150"
  case crop160x160 = "160160"
  case crop175x230 = "175230"
  case crop240x160 = "240160"
  case crop240x320 = "240320"
  case crop255x172 = "255172"
  case crop300x267 = "300267"
  case crop320x240 = "320240"
  case crop388x213 = "388213"
  case crop480x160 = "480160"
  case resize520x390 = "520390"
  case resize640x480 = "640480"
  case resize800x600 = "800600"
  case resize960x320 = "960320"
  case resize960x720 = "960720"
  case resize1024x768 = "1024768"
  case resize1024x1280 = "10241280"
  case resize1200x400 = "1200400"
  case resize1280x960 = "1200960"
  case resize1280x1024 = "12801024"
  case crop1440x480 = "1440480"
  case resize1532x512 = "1532512"
  case resize1680x560 = "1680560"
  case resize1920x640 = "1920640"
  case resize1920x1080 = "19201080"
  case resize1920x1440 = "19201440"
  case resize2240x1680 = "22401680"
  case resize2560x1920 = "25601920"
  case namedContent = "content"
  case namedSite = "site"
  case namedLK = "lk"
}

enum CDNHosts: String {
  case cloudEsoft = "cloud.esoft.digital"
  case cdnEsoft = "cdn.esoft.digital"
  case apiMediaEtagi = "api-media.etagi.com"
  case cdnMediaEtagi = "cdn-media.etagi.com"
  case apiMediaNovoe = "api-media.novoe.od.ua"
}

class ImageLinkBuilder {
  private var link: String
  private var size: CDNImageSizes = .resize640x480
  private var type: CDNImageTypes?
  private var source: CDNHosts = .cloudEsoft

  init(_ baseURL: String) {
    self.link = baseURL
  }

  @discardableResult
  func set(size: CDNImageSizes) -> ImageLinkBuilder {
    self.size = size

    return self
  }

  @discardableResult
  func set(type: CDNImageTypes) -> ImageLinkBuilder {
    self.type = type

    return self
  }

  @discardableResult
  func set(source: CDNHosts) -> ImageLinkBuilder {
    self.source = source

    return self
  }

  func build() -> String {
    let addressString: String = [self.source.rawValue, self.size.rawValue, self.type?.rawValue, self.link]
      .compactMap { $0 }
      .joined(separator: "/")
      .replacingOccurrences(of: "\\/{2,}", with: "\\/", options: .regularExpression)

    return "https://\(addressString)"
  }
}
