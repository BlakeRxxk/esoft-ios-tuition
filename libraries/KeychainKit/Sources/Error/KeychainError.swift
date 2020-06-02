//
//  KeychainError.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public let keychainAccessErrorDomain = "com.esoft.keychain.error"

public enum KeychainError: OSStatus, Error {
  case invalidDataCast                    = 1000
  case success                            = 0
  case unimplemented                      = -4
  case diskFull                           = -34
  case io                                 = -36
  case opWr                               = -49
  case param                              = -50
  case wrPerm                             = -61
  case allocate                           = -108
  case userCanceled                       = -128
  case badReq                             = -909
  case internalComponent                  = -2070
  case notAvailable                       = -25291
  case readOnly                           = -25292
  case authFailed                         = -25293
  case noSuchKeychain                     = -25294
  case invalidKeychain                    = -25295
  case duplicateKeychain                  = -25296
  case duplicateCallback                  = -25297
  case invalidCallback                    = -25298
  case duplicateItem                      = -25299
  case itemNotFound                       = -25300
  case bufferTooSmall                     = -25301
  case dataTooLarge                       = -25302
  case noSuchAttr                         = -25303
  case invalidItemRef                     = -25304
  case invalidSearchRef                   = -25305
  case noSuchClass                        = -25306
  case noDefaultKeychain                  = -25307
  case interactionNotAllowed              = -25308
  case readOnlyAttr                       = -25309
  case wrongSecVersion                    = -25310
  case keySizeNotAllowed                  = -25311
  case noStorageModule                    = -25312
  case noCertificateModule                = -25313
  case noPolicyModule                     = -25314
  case interactionRequired                = -25315
  case dataNotAvailable                   = -25316
  case dataNotModifiable                  = -25317
  case createChainFailed                  = -25318
  case invalidPrefsDomain                 = -25319
  case inDarkWake                         = -25320
  case aclNotSimple                       = -25240
  case policyNotFound                     = -25241
  case invalidTrustSetting                = -25242
  case noAccessForItem                    = -25243
  case invalidOwnerEdit                   = -25244
  case trustNotAvailable                  = -25245
  case unsupportedFormat                  = -25256
  case unknownFormat                      = -25257
  case keyIsSensitive                     = -25258
  case multiplePrivKeys                   = -25259
  case passphraseRequired                 = -25260
  case invalidPasswordRef                 = -25261
  case invalidTrustSettings               = -25262
  case noTrustSettings                    = -25263
  case pkcs12VerifyFailure                = -25264
  case invalidCertificate                 = -26265
  case notSigner                          = -26267
  case policyDenied                       = -26270
  case invalidKey                         = -26274
  case decode                             = -26275
  case `internal`                         = -26276
  case unsupportedAlgorithm               = -26268
  case unsupportedOperation               = -26271
  case unsupportedPadding                 = -26273
  case itemInvalidKey                     = -34000
  case itemInvalidKeyType                 = -34001
  case itemInvalidValue                   = -34002
  case itemClassMissing                   = -34003
  case itemMatchUnsupported               = -34004
  case useItemListUnsupported             = -34005
  case useKeychainUnsupported             = -34006
  case useKeychainListUnsupported         = -34007
  case returnDataUnsupported              = -34008
  case returnAttributesUnsupported        = -34009
  case returnRefUnsupported               = -34010
  case returnPersitentRefUnsupported      = -34011
  case valueRefUnsupported                = -34012
  case valuePersistentRefUnsupported      = -34013
  case returnMissingPointer               = -34014
  case matchLimitUnsupported              = -34015
  case itemIllegalQuery                   = -34016
  case waitForCallback                    = -34017
  case missingEntitlement                 = -34018
  case upgradePending                     = -34019
  case mpSignatureInvalid                 = -25327
  case otrTooOld                          = -25328
  case otrIDTooNew                        = -25329
  case serviceNotAvailable                = -67585
  case insufficientClientID               = -67586
  case deviceReset                        = -67587
  case deviceFailed                       = -67588
  case appleAddAppACLSubject              = -67589
  case applePublicKeyIncomplete           = -67590
  case appleSignatureMismatch             = -67591
  case appleInvalidKeyStartDate           = -67592
  case appleInvalidKeyEndDate             = -67593
  case conversionError                    = -67594
  case appleSSLv2Rollback                 = -67595
  case quotaExceeded                      = -67596
  case fileTooBig                         = -67597
  case invalidDatabaseBlob                = -67598
  case invalidKeyBlob                     = -67599
  case incompatibleDatabaseBlob           = -67600
  case incompatibleKeyBlob                = -67601
  case hostNameMismatch                   = -67602
  case unknownCriticalExtensionFlag       = -67603
  case noBasicConstraints                 = -67604
  case noBasicConstraintsCA               = -67605
  case invalidAuthorityKeyID              = -67606
  case invalidSubjectKeyID                = -67607
  case invalidKeyUsageForPolicy           = -67608
  case invalidExtendedKeyUsage            = -67609
  case invalidIDLinkage                   = -67610
  case pathLengthConstraintExceeded       = -67611
  case invalidRoot                        = -67612
  case crlExpired                         = -67613
  case crlNotValidYet                     = -67614
  case crlNotFound                        = -67615
  case crlServerDown                      = -67616
  case crlBadURI                          = -67617
  case unknownCertExtension               = -67618
  case unknownCRLExtension                = -67619
  case crlNotTrusted                      = -67620
  case crlPolicyFailed                    = -67621
  case idpFailure                         = -67622
  case smimeEmailAddressesNotFound        = -67623
  case smimeBadExtendedKeyUsage           = -67624
  case smimeBadKeyUsage                   = -67625
  case smimeKeyUsageNotCritical           = -67626
  case smimeNoEmailAddress                = -67627
  case smimeSubjAltNameNotCritical        = -67628
  case sslBadExtendedKeyUsage             = -67629
  case ocspBadResponse                    = -67630
  case ocspBadRequest                     = -67631
  case ocspUnavailable                    = -67632
  case ocspStatusUnrecognized             = -67633
  case endOfData                          = -67634
  case incompleteCertRevocationCheck      = -67635
  case networkFailure                     = -67636
  case ocspNotTrustedToAnchor             = -67637
  case recordModified                     = -67638
  case ocspSignatureError                 = -67639
  case ocspNoSigner                       = -67640
  case ocspResponderMalformedReq          = -67641
  case ocspResponderInternalError         = -67642
  case ocspResponderTryLater              = -67643
  case ocspResponderSignatureRequired     = -67644
  case ocspResponderUnauthorized          = -67645
  case ocspResponseNonceMismatch          = -67646
  case codeSigningBadCertChainLength      = -67647
  case codeSigningNoBasicConstraints      = -67648
  case codeSigningBadPathLengthConstraint = -67649
  case codeSigningNoExtendedKeyUsage      = -67650
  case codeSigningDevelopment             = -67651
  case resourceSignBadCertChainLength     = -67652
  case resourceSignBadExtKeyUsage         = -67653
  case trustSettingDeny                   = -67654
  case invalidSubjectName                 = -67655
  case unknownQualifiedCertStatement      = -67656
  case mobileMeRequestQueued              = -67657
  case mobileMeRequestRedirected          = -67658
  case mobileMeServerError                = -67659
  case mobileMeServerNotAvailable         = -67660
  case mobileMeServerAlreadyExists        = -67661
  case mobileMeServerServiceErr           = -67662
  case mobileMeRequestAlreadyPending      = -67663
  case mobileMeNoRequestPending           = -67664
  case mobileMeCSRVerifyFailure           = -67665
  case mobileMeFailedConsistencyCheck     = -67666
  case notInitialized                     = -67667
  case invalidHandleUsage                 = -67668
  case pvcReferentNotFound                = -67669
  case functionIntegrityFail              = -67670
  case internalError                      = -67671
  case memoryError                        = -67672
  case invalidData                        = -67673
  case mdsError                           = -67674
  case invalidPointer                     = -67675
  case selfCheckFailed                    = -67676
  case functionFailed                     = -67677
  case moduleManifestVerifyFailed         = -67678
  case invalidGUID                        = -67679
  case invalidHandle                      = -67680
  case invalidDBList                      = -67681
  case invalidPassthroughID               = -67682
  case invalidNetworkAddress              = -67683
  case crlAlreadySigned                   = -67684
  case invalidNumberOfFields              = -67685
  case verificationFailure                = -67686
  case unknownTag                         = -67687
  case invalidSignature                   = -67688
  case invalidName                        = -67689
  case invalidCertificateRef              = -67690
  case invalidCertificateGroup            = -67691
  case tagNotFound                        = -67692
  case invalidQuery                       = -67693
  case invalidValue                       = -67694
  case callbackFailed                     = -67695
  case aclDeleteFailed                    = -67696
  case aclReplaceFailed                   = -67697
  case aclAddFailed                       = -67698
  case aclChangeFailed                    = -67699
  case invalidAccessCredentials           = -67700
  case invalidRecord                      = -67701
  case invalidACL                         = -67702
  case invalidSampleValue                 = -67703
  case incompatibleVersion                = -67704
  case privilegeNotGranted                = -67705
  case invalidScope                       = -67706
  case pvcAlreadyConfigured               = -67707
  case invalidPVC                         = -67708
  case emmLoadFailed                      = -67709
  case emmUnloadFailed                    = -67710
  case addinLoadFailed                    = -67711
  case invalidKeyRef                      = -67712
  case invalidKeyHierarchy                = -67713
  case addinUnloadFailed                  = -67714
  case libraryReferenceNotFound           = -67715
  case invalidAddinFunctionTable          = -67716
  case invalidServiceMask                 = -67717
  case moduleNotLoaded                    = -67718
  case invalidSubServiceID                = -67719
  case attributeNotInContext              = -67720
  case moduleManagerInitializeFailed      = -67721
  case moduleManagerNotFound              = -67722
  case eventNotificationCallbackNotFound  = -67723
  case inputLengthError                   = -67724
  case outputLengthError                  = -67725
  case privilegeNotSupported              = -67726
  case deviceError                        = -67727
  case attachHandleBusy                   = -67728
  case notLoggedIn                        = -67729
  case algorithmMismatch                  = -67730
  case keyUsageIncorrect                  = -67731
  case keyBlobTypeIncorrect               = -67732
  case keyHeaderInconsistent              = -67733
  case unsupportedKeyFormat               = -67734
  case unsupportedKeySize                 = -67735
  case invalidKeyUsageMask                = -67736
  case unsupportedKeyUsageMask            = -67737
  case invalidKeyAttributeMask            = -67738
  case unsupportedKeyAttributeMask        = -67739
  case invalidKeyLabel                    = -67740
  case unsupportedKeyLabel                = -67741
  case invalidKeyFormat                   = -67742
  case unsupportedVectorOfBuffers         = -67743
  case invalidInputVector                 = -67744
  case invalidOutputVector                = -67745
  case invalidContext                     = -67746
  case invalidAlgorithm                   = -67747
  case invalidAttributeKey                = -67748
  case missingAttributeKey                = -67749
  case invalidAttributeInitVector         = -67750
  case missingAttributeInitVector         = -67751
  case invalidAttributeSalt               = -67752
  case missingAttributeSalt               = -67753
  case invalidAttributePadding            = -67754
  case missingAttributePadding            = -67755
  case invalidAttributeRandom             = -67756
  case missingAttributeRandom             = -67757
  case invalidAttributeSeed               = -67758
  case missingAttributeSeed               = -67759
  case invalidAttributePassphrase         = -67760
  case missingAttributePassphrase         = -67761
  case invalidAttributeKeyLength          = -67762
  case missingAttributeKeyLength          = -67763
  case invalidAttributeBlockSize          = -67764
  case missingAttributeBlockSize          = -67765
  case invalidAttributeOutputSize         = -67766
  case missingAttributeOutputSize         = -67767
  case invalidAttributeRounds             = -67768
  case missingAttributeRounds             = -67769
  case invalidAlgorithmParms              = -67770
  case missingAlgorithmParms              = -67771
  case invalidAttributeLabel              = -67772
  case missingAttributeLabel              = -67773
  case invalidAttributeKeyType            = -67774
  case missingAttributeKeyType            = -67775
  case invalidAttributeMode               = -67776
  case missingAttributeMode               = -67777
  case invalidAttributeEffectiveBits      = -67778
  case missingAttributeEffectiveBits      = -67779
  case invalidAttributeStartDate          = -67780
  case missingAttributeStartDate          = -67781
  case invalidAttributeEndDate            = -67782
  case missingAttributeEndDate            = -67783
  case invalidAttributeVersion            = -67784
  case missingAttributeVersion            = -67785
  case invalidAttributePrime              = -67786
  case missingAttributePrime              = -67787
  case invalidAttributeBase               = -67788
  case missingAttributeBase               = -67789
  case invalidAttributeSubprime           = -67790
  case missingAttributeSubprime           = -67791
  case invalidAttributeIterationCount     = -67792
  case missingAttributeIterationCount     = -67793
  case invalidAttributeDLDBHandle         = -67794
  case missingAttributeDLDBHandle         = -67795
  case invalidAttributeAccessCredentials  = -67796
  case missingAttributeAccessCredentials  = -67797
  case invalidAttributePublicKeyFormat    = -67798
  case missingAttributePublicKeyFormat    = -67799
  case invalidAttributePrivateKeyFormat   = -67800
  case missingAttributePrivateKeyFormat   = -67801
  case invalidAttributeSymmetricKeyFormat = -67802
  case missingAttributeSymmetricKeyFormat = -67803
  case invalidAttributeWrappedKeyFormat   = -67804
  case missingAttributeWrappedKeyFormat   = -67805
  case stagedOperationInProgress          = -67806
  case stagedOperationNotStarted          = -67807
  case verifyFailed                       = -67808
  case querySizeUnknown                   = -67809
  case blockSizeMismatch                  = -67810
  case publicKeyInconsistent              = -67811
  case deviceVerifyFailed                 = -67812
  case invalidLoginName                   = -67813
  case alreadyLoggedIn                    = -67814
  case invalidDigestAlgorithm             = -67815
  case invalidCRLGroup                    = -67816
  case certificateCannotOperate           = -67817
  case certificateExpired                 = -67818
  case certificateNotValidYet             = -67819
  case certificateRevoked                 = -67820
  case certificateSuspended               = -67821
  case insufficientCredentials            = -67822
  case invalidAction                      = -67823
  case invalidAuthority                   = -67824
  case verifyActionFailed                 = -67825
  case invalidCertAuthority               = -67826
  case invaldCRLAuthority                 = -67827
  case invalidCRLEncoding                 = -67828
  case invalidCRLType                     = -67829
  case invalidCRL                         = -67830
  case invalidFormType                    = -67831
  case invalidID                          = -67832
  case invalidIdentifier                  = -67833
  case invalidIndex                       = -67834
  case invalidPolicyIdentifiers           = -67835
  case invalidTimeString                  = -67836
  case invalidReason                      = -67837
  case invalidRequestInputs               = -67838
  case invalidResponseVector              = -67839
  case invalidStopOnPolicy                = -67840
  case invalidTuple                       = -67841
  case multipleValuesUnsupported          = -67842
  case notTrusted                         = -67843
  case noDefaultAuthority                 = -67844
  case rejectedForm                       = -67845
  case requestLost                        = -67846
  case requestRejected                    = -67847
  case unsupportedAddressType             = -67848
  case unsupportedService                 = -67849
  case invalidTupleGroup                  = -67850
  case invalidBaseACLs                    = -67851
  case invalidTupleCredendtials           = -67852
  case invalidEncoding                    = -67853
  case invalidValidityPeriod              = -67854
  case invalidRequestor                   = -67855
  case requestDescriptor                  = -67856
  case invalidBundleInfo                  = -67857
  case invalidCRLIndex                    = -67858
  case noFieldValues                      = -67859
  case unsupportedFieldFormat             = -67860
  case unsupportedIndexInfo               = -67861
  case unsupportedLocality                = -67862
  case unsupportedNumAttributes           = -67863
  case unsupportedNumIndexes              = -67864
  case unsupportedNumRecordTypes          = -67865
  case fieldSpecifiedMultiple             = -67866
  case incompatibleFieldFormat            = -67867
  case invalidParsingModule               = -67868
  case databaseLocked                     = -67869
  case datastoreIsOpen                    = -67870
  case missingValue                       = -67871
  case unsupportedQueryLimits             = -67872
  case unsupportedNumSelectionPreds       = -67873
  case unsupportedOperator                = -67874
  case invalidDBLocation                  = -67875
  case invalidAccessRequest               = -67876
  case invalidIndexInfo                   = -67877
  case invalidNewOwner                    = -67878
  case invalidModifyMode                  = -67879
  case missingRequiredExtension           = -67880
  case extendedKeyUsageNotCritical        = -67881
  case timestampMissing                   = -67882
  case timestampInvalid                   = -67883
  case timestampNotTrusted                = -67884
  case timestampServiceNotAvailable       = -67885
  case timestampBadAlg                    = -67886
  case timestampBadRequest                = -67887
  case timestampBadDataFormat             = -67888
  case timestampTimeNotAvailable          = -67889
  case timestampUnacceptedPolicy          = -67890
  case timestampUnacceptedExtension       = -67891
  case timestampAddInfoNotAvailable       = -67892
  case timestampSystemFailure             = -67893
  case signingTimeMissing                 = -67894
  case timestampRejection                 = -67895
  case timestampWaiting                   = -67896
  case timestampRevocationWarning         = -67897
  case timestampRevocationNotification    = -67898
  case unexpectedError                    = -99999
}

extension KeychainError {
  public init(_ error: Error) {
    if let error = error as? KeychainError {
      self = error
    } else {
      self = .unexpectedError
    }
  }
}

extension KeychainError: RawRepresentable {
  public init(status: OSStatus) {
    if let mappedStatus = KeychainError(rawValue: status) {
      self = mappedStatus
    } else {
      self = .unexpectedError
    }
  }
}
