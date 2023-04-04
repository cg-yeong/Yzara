import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project.app(name: "BasicVideoChat", dependencies: [Module.common.project])
let demoTarget = Project.makeProjectTarget(name: DemoSample.basicVideoChat.name,
                                           dependencies: [
                                            Module.feature.project,
                                            Module.common.project
                                           ])

let project = Project(name: DemoSample.basicVideoChat.name,
                      targets: [demoTarget])
