// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIVVMaterialComponent",
     platforms: [.macOS(.v10_12),
                                  .iOS(.v10),
                                  .tvOS(.v10),
                                  .watchOS(.v3)],
                      products: [.library(name: "UIVVMaterialComponent",
                                          targets: ["UIVVMaterialComponent"])],
                      targets: [.target(name: "UIVVMaterialComponent",
                                        path: "UIVVMaterialComponent/Classes"),
                                .testTarget(name: "UIVVMaterialComponentTests",
                                            dependencies: ["UIVVMaterialComponent"],
                                            path: "Tests")],
                      swiftLanguageVersions: [.v5])
)
