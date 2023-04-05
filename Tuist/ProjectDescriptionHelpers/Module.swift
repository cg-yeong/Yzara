//
//  Project+Name.swift
//  ProjectDescriptionHelpers
//
//  Created by root0 on 2023/04/04.
//

import ProjectDescription

public enum Module: String, CaseIterable {
    
    case feature = "Feature"
    case core = "Core"
    case common = "Common"
    case app = "App"
    
}

public enum DemoSample: String, CaseIterable {
    
    case basicVideoChat = "BasicVideoChat"
    case QuickSwitchChannel = "QuickSwitchChannel"
    
}

extension Module {
    
    public var name: String {
        return self.rawValue
    }
    
    public var path: Path {
        return .relativeToRoot(Project.YzaraSettings._PROJECT_PATH + "/\(self.name)")
    }
    
    public var sourcePath: Path {
        return .relativeToRoot(Project.YzaraSettings._PROJECT_PATH + "/\(self.name)" + "/Sources/**")
    }
    
    
    public var project: TargetDependency {
        return .project(target: self.name, path: self.path)
    }
    
}

extension DemoSample {
    public var name: String {
        return self.rawValue
    }
    
    public var path: Path {
        return .relativeToRoot(Project.YzaraSettings._DEMO_PATH + "/\(self.name)")
    }
    
    public var sourcePath: Path {
        return .relativeToRoot(Project.YzaraSettings._DEMO_PATH + "/\(self.name)" + "/Sources/**")
    }
    
    
    public var project: TargetDependency {
        return .project(target: self.name, path: self.path)
    }
}
