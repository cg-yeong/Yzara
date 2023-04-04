//
//  Project+Name.swift
//  ProjectDescriptionHelpers
//
//  Created by root0 on 2023/04/04.
//

import ProjectDescription

public enum Module: String, CaseIterable {
    
    case common = "Common"
    case basicVideoChat = "BasicVideoChat"
    
}

extension Module {
    
    public var name: String {
        return self.rawValue
    }
    
    public var path: Path {
        return .relativeToRoot("Apps/" + self.name)
    }
    
    public var project: TargetDependency {
        return .project(target: self.name, path: self.path)
    }
    
}
