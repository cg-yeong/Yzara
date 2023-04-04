//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by root0 on 2023/04/04.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(name: "Yzara",
                          dependencies: [
                            Module.feature.project,
                            Module.common.project
                          ])

