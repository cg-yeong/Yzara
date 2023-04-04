//
//  Project+Setting.swift
//  ProjectDescriptionHelpers
//
//  Created by root0 on 2023/04/04.
//

import Foundation
import ProjectDescription

extension Project {
    
    public enum YzaraSettings {
        public static let _BUILD: SettingValue = "0"
        public static let _VERSION: SettingValue = "1.0.001"
        public static let _PLATFORM: Platform = .iOS
        public static let _OS_PLATFORM_VERSION: String = "14.0"
        public static let _PROJECT_NAME: String = "Yzara"
        public static let _PROJECT_PATH: String = "Projects"
        public static let _DEMO_PATH: String = _PROJECT_PATH + "/Demo"
        public static let _APP_PATH: String = ""
        public static let _APP_EXTENSION_PATH: String = ""
        public static let _ENTITLEMENTS: String = ""
        public static let _BUNDLE_ID: String = "com.yeong.Yzara"
//        public static let _INFOLIST: InfoPlist = .file(path: .relativeToManifest("Resources/Info.plist"))
//        public static var _PROJECT_HEADER: FileList = [""]
//        public static var _BRIDGING_HEADER: SettingValue = SettingValue(stringLiteral: "")
        
        
        static var _DEFAULT_PROJECT_SETTING: SettingsDictionary = SettingsDictionary().codeSignIdentityAppleDevelopment()
            .merging([
                "TARGETED_DEVICE_FAMILY" : "1,2",
                "IPHONEOS_DEPLOYMENT_TARGET" : .string(_OS_PLATFORM_VERSION),
                "MARKETING_VERSION" : YzaraSettings._VERSION,
                "CURRENT_PROJECT_VERSION" : YzaraSettings._BUILD,
                "SDKROOT" : "iphoneos",
                "OTHER_LDFLAGS" : "-Objc",
                "DEBUG_INFORMATION_FORMAT" : "dwarf-with-dsym"
            ])
        
        static func makeDebugSetting() -> SettingsDictionary {
            return _DEFAULT_PROJECT_SETTING.merging([
                "SWIFT_COMPILATION_MODE" : "singlefile",
                "SWIFT_ACTIVE_COMPILATION_CONDITIOnS" : "DEBUG",
                "OTHER_SWIFT_FLAGS" : "$(inherited) -D DEBUG"
            ])
        }
    }
    
    
    
    public enum Dependency {
        public enum SPM {
            static let Rxswift: TargetDependency = .external(name: "RxSwift")
            static let Rxcocoa: TargetDependency = .external(name: "RxCocoa")
            static let Rxdatasources: TargetDependency = .external(name: "RxDataSources")
            static let Alamofire: TargetDependency = .external(name: "Alamofire")
            static let Snapkit: TargetDependency = .external(name: "SnapKit")
            static let Then: TargetDependency = .external(name: "Then")
            static let Pinlayout: TargetDependency = .external(name: "PinLayout")
            static let Flexlayout: TargetDependency = .external(name: "FlexLayout")
            static let Kingfisher: TargetDependency = .external(name: "Kingfisher")
            static let Swiftyjson: TargetDependency = .external(name: "SwiftyJSON")
            static let Toast: TargetDependency = .external(name: "Toast")
            static let Beaverlog: TargetDependency = .external(name: "SwiftyBeaver")
            static let Starscream: TargetDependency = .external(name: "SocketIO")
            static let Rtcbasic: TargetDependency = .external(name: "RtcBasic")
        }
        
        public static let defaultFrameworks: [TargetDependency] = [
            Dependency.SPM.Rxswift,
            Dependency.SPM.Rxcocoa,
            Dependency.SPM.Rxdatasources,
            Dependency.SPM.Alamofire,
            Dependency.SPM.Snapkit,
            Dependency.SPM.Then,
            Dependency.SPM.Pinlayout,
            Dependency.SPM.Flexlayout,
            Dependency.SPM.Kingfisher,
            Dependency.SPM.Swiftyjson,
            Dependency.SPM.Toast,
            Dependency.SPM.Beaverlog,
            Dependency.SPM.Starscream,
            Dependency.SPM.Rtcbasic
        ]
    }
    
}
