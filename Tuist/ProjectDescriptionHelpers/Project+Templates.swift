import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(name: String,
                           dependencies: [TargetDependency] = []) -> Project {
        
        return self.project(name: name, product: .app, dependencies: dependencies)
    }
    
    public static func project(name: String,
                               product: Product,
                               dependencies: [TargetDependency] = [],
                               schemes: [Scheme] = [],
                               resources: ResourceFileElement? = nil) -> Project {
        
        return Project(
            name: name,
            targets: [makeProjectTargets(name: name, dependencies: dependencies)],
            schemes: []
        )
        
    }
    
    public static func framework(name: String,
                                 dependencies: [TargetDependency] = []) -> Project {
        return .project(name: name,
                        product: .framework,
                        bundleID: YzaraSettings._BUNDLE_ID + ".\(name)",
                        dependencies: dependencies
        )
    }
    
    public static func makeProjectTargets(name: String, dependencies: [TargetDependency]) -> Target {
        
        let resourcesPath: ResourceFileElements = [
            .glob(pattern: .relativeToManifest("Resources/**"))
        ]
        
        let sourcesPath: SourceFilesList = [
            .glob(.relativeToManifest("Sources/**"))
        ]
        
        let infoPlist: [String : InfoPlist.Value] = [
            "CFBundleShortVersionString" : "1.0",
            "CFBundleVersion" : "1",
            "UILaunchStoryboardName": "LaunchScreen",
                    "UIApplicationSceneManifest": [
                        "UIApplicationSupportsMultipleScenes": false,
                        "UISceneConfigurations": [
                            "UIWindowSceneSessionRoleApplication": [
                                [
                                    "UISceneConfigurationName": "NO",
                                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                                ],
                            ]
                        ]
                    ],
        ]
        
        
        return Target(
            name: name,
            platform: .iOS,
            product: .app,
            bundleId: YzaraSettings._BUNDLE_ID + ".\(name)",
            deploymentTarget: .iOS(targetVersion: YzaraSettings._OS_PLATFORM_VERSION, devices: [.ipad, .iphone]),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: sourcesPath,
            resources: resourcesPath,
            dependencies: dependencies,
            settings: .settings(base: YzaraSettings._DEFAULT_PROJECT_SETTING.codeSignIdentityAppleDevelopment(),
                                debug: YzaraSettings.makeDebugSetting().codeSignIdentityAppleDevelopment(),
                                release: YzaraSettings._DEFAULT_PROJECT_SETTING.codeSignIdentityAppleDevelopment(),
                                defaultSettings: .recommended)
        )
        
    }
    
    public static func project(name: String,
                               product: Product,
                               bundleID: String,
                               dependencies: [TargetDependency] = []) -> Project {
        
        let resourcesPath: ResourceFileElements = [
            .glob(pattern: .relativeToManifest("Resources/**"))
        ]
        
        let sourcesPath: SourceFilesList = [
            .glob(.relativeToManifest("Sources/**"))
        ]
        
        return Project(
            name: name,
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: product,
                    bundleId: bundleID,
                    deploymentTarget: .iOS(targetVersion: "14.0", devices: [.ipad, .iphone]),
                    infoPlist: InfoPlist.default,
                    sources: sourcesPath,
                    resources: resourcesPath,
                    scripts: [],
                    dependencies: dependencies
                )
            ])
    }
    
    public static func makeScheme(name: String) -> [Scheme] {
        return [
            Scheme(
                name: "\(name)_dev",
                shared: true,
                hidden: false,
                buildAction: .buildAction(targets: [TargetReference(stringLiteral: "\(name)_dev")]),
                runAction: .runAction(configuration: .debug)
            )
        ]
    }
    
    
    
    
    
    
//    public static func app(name: String, platform: Platform, additionalTargets: [String]) -> Project {
//        var targets = makeAppTargets(name: name,
//                                     platform: platform,
//                                     dependencies: additionalTargets.map { TargetDependency.target(name: $0) })
//        targets += additionalTargets.flatMap({ makeFrameworkTargets(name: $0, platform: platform) })
//        return Project(name: name,
//                       organizationName: "tuist.io",
//                       targets: targets)
//    }
//
//    // MARK: - Private
//
//    /// Helper function to create a framework target and an associated unit test target
//    private static func makeFrameworkTargets(name: String, platform: Platform) -> [Target] {
//        let sources = Target(name: name,
//                platform: platform,
//                product: .framework,
//                bundleId: "io.tuist.\(name)",
//                infoPlist: .default,
//                sources: ["Targets/\(name)/Sources/**"],
//                resources: [],
//                dependencies: [])
//        let tests = Target(name: "\(name)Tests",
//                platform: platform,
//                product: .unitTests,
//                bundleId: "io.tuist.\(name)Tests",
//                infoPlist: .default,
//                sources: ["Targets/\(name)/Tests/**"],
//                resources: [],
//                dependencies: [.target(name: name)])
//        return [sources, tests]
//    }
//
//    /// Helper function to create the application target and the unit test target.
//    private static func makeAppTargets(name: String, platform: Platform, dependencies: [TargetDependency]) -> [Target] {
//        let platform: Platform = platform
//        let infoPlist: [String: InfoPlist.Value] = [
//            "CFBundleShortVersionString": "1.0",
//            "CFBundleVersion": "1",
//            "UIMainStoryboardFile": "",
//            "UILaunchStoryboardName": "LaunchScreen"
//            ]
//
//        let mainTarget = Target(
//            name: name,
//            platform: platform,
//            product: .app,
//            bundleId: "io.tuist.\(name)",
//            infoPlist: .extendingDefault(with: infoPlist),
//            sources: ["Targets/\(name)/Sources/**"],
//            resources: ["Targets/\(name)/Resources/**"],
//            dependencies: dependencies
//        )
//
//        let testTarget = Target(
//            name: "\(name)Tests",
//            platform: platform,
//            product: .unitTests,
//            bundleId: "io.tuist.\(name)Tests",
//            infoPlist: .default,
//            sources: ["Targets/\(name)/Tests/**"],
//            dependencies: [
//                .target(name: "\(name)")
//        ])
//        return [mainTarget, testTarget]
//    }
}
