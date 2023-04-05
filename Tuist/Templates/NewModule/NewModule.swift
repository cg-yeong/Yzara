//
//  NewModule.swift
//  ProjectDescriptionHelpers
//
//  Created by root0 on 2023/04/05.
//

import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

func templatePath(_ path: String) -> Path {
    "../\(path)"
}

let template = Template(
    description: "A template for new module",
    attributes: [
        nameAttribute
    ],
    items: [
        .file(path: "Projects/Demo/\(nameAttribute)/Project.swift", templatePath: "NewModule.stencil"),
        .file(path: "Projects/Demo/\(nameAttribute)/Sources/AppDelegate.swift", templatePath: "AppDelegate.stencil"),
        .file(path: "Projects/Demo/\(nameAttribute)/Sources/SceneDelegate.swift", templatePath: "SceneDelegate.stencil"),
        .file(path: "Projects/Demo/\(nameAttribute)/Resources/LaunchScreen.storyboard", templatePath: "LaunchScreen.stencil")
    ]
)
