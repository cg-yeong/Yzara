import ProjectDescription
import ProjectDescriptionHelpers

let demoTarget = Project.makeProjectTarget(name: DemoSample.QuickSwitchChannel.name,
                                           dependencies: [
                                            Module.feature.project,
                                            Module.common.project
                                           ])

let project = Project(name: DemoSample.QuickSwitchChannel.name,
                      targets: [demoTarget])

