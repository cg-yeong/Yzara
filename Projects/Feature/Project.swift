//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by root0 on 2023/04/04.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: Module.feature.name,
                                dependencies: [
                                    Module.core.project,
                                    Module.common.project
                                ])
