//
//  StorageConfiguration.swift
//  StorageKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Realm
import RealmSwift

public final class StorageConfiguration {
  private var storageType: StorageType
  
  public lazy var configuration: Realm.Configuration = {
    var configuration = Realm.Configuration()
    let bundlePath = Bundle.main.url(forResource: "com.esoft", withExtension: "storage")
    configuration.fileURL = configuration
      .fileURL?
      .deletingLastPathComponent()
      .appendingPathComponent("client")
      .appendingPathExtension("realm")
    
    print(configuration.fileURL)
    // Setup Realm Bundle from prepopulated file if exist
    // which located in $PROJECT_DIR/Resourses/Realm/
    
    // @see https://realm.io/docs/swift/latest/#configuring-a-realm
    if bundlePath != nil && !realmFileExists(url: configuration.fileURL) {
      copyStaticRealm(bundlePath: bundlePath!, realmFilePath: configuration.fileURL)
    }
    
    if storageType == .inmemory {
      configuration.inMemoryIdentifier = "EsoftClientInMemoryStorage"
    }
    
    configuration.schemaVersion = 12
    
    // TotalBytes refers to the size of the file on disk in bytes (data + free space)
    // UsedBytes refers to the number of bytes used by data in the file
    
    // Compact if the file is over 50MB in size and less than 50% 'used'
    // @see https://realm.io/docs/objc/latest/#limitations-file-size
    configuration.shouldCompactOnLaunch = { totalBytes, usedBytes in
      let fiftyMB = 50 * 1024 * 1024
      return (totalBytes > fiftyMB) && (Double(usedBytes) / Double(totalBytes)) < 0.5
    }
    
    // Set the block which will be called automatically when opening a Realm with
    // a schema version lower than the one set above
    
    // @see https://realm.io/docs/objc/latest/#limitations-file-size
    configuration.migrationBlock = { migration, oldSchemaVersion in
      if oldSchemaVersion < 1 {
        // Nothing to do, yet
      }
    }
    return configuration
  }()
  
  public init(type: StorageType = .persistent) {
    storageType = type
  }
  
  private func copyStaticRealm(bundlePath: URL?, realmFilePath: URL?) {
    guard bundlePath != nil && realmFilePath != nil else { return }
    
    do {
      try FileManager.default.copyItem(atPath: bundlePath!.path, toPath: realmFilePath!.path)
    } catch let error as NSError {
      print(error)
    }
  }
  
  private func realmFileExists(url: URL?) -> Bool {
    guard let realmURL = url else { return false }
    return FileManager.default.fileExists(atPath: realmURL.path)
  }
}
