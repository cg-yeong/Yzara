//
//  Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by root0 on 2023/04/04.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/ReactiveX/RxSwift", requirement: .branch("main")),
        .remote(url: "https://github.com/RxSwiftCommunity/RxDataSources", requirement: .branch("main")),
        .remote(url: "https://github.com/Alamofire/Alamofire", requirement: .branch("master")),
        .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMinor(from: "5.0.1")),
        .remote(url: "https://github.com/devxoul/Then", requirement: .upToNextMajor(from: "2.7.0")),
        .remote(url: "https://github.com/layoutBox/PinLayout.git", requirement: .upToNextMajor(from: "1.10.4")),
        .remote(url: "https://github.com/layoutBox/FlexLayout.git", requirement: .upToNextMajor(from: "1.3.30")),
        .remote(url: "https://github.com/onevcat/Kingfisher", requirement: .upToNextMajor(from: "5.15.6")),
        .remote(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", requirement: .upToNextMajor(from: "4.0.0")),
        .remote(url: "https://github.com/scalessec/Toast-Swift", requirement: .branch("master")),
        .remote(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", requirement: .upToNextMajor(from: "1.9.0")),
        .remote(url: "https://github.com/socketio/socket.io-client-swift", requirement: .upToNextMinor(from: "16.0.1")),
        .remote(url: "https://github.com/AgoraIO/AgoraRtcEngine_iOS", requirement: .upToNextMajor(from: "4.0.1")),
    ],
    platforms: [.iOS]
)
