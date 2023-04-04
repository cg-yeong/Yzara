//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by root0 on 2023/04/04.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: Module.core.name,
                                dependencies: [
                                    Module.common.project
                                ])
