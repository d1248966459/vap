// swift-tools-version: 6.0

import PackageDescription

// This manifest is intended for the QGVAPlayer 2.0.19 fork.
// The package tag/revision, rather than this file, determines the published version.
let package = Package(
    name: "QGVAPlayer",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "QGVAPlayer",
            targets: ["QGVAPlayer"]
        )
    ],
    targets: [
        .target(
            name: "QGVAPlayer",
            // Keep the upstream source layout so the CocoaPods and SPM builds use the same files.
            path: "iOS/QGVAPlayer/QGVAPlayer",
            exclude: ["Info.plist"],
            // Compile the VAP shader as a package resource used by the Metal player.
            resources: [
                .process("Shaders/QGHWDShaders.metal")
            ],
            // Keep public headers flat so SwiftPM can generate a valid Objective-C module.
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("Classes"),
                .headerSearchPath("Classes/Controllers"),
                .headerSearchPath("Classes/Controllers/Decoders"),
                .headerSearchPath("Classes/MP4Parser"),
                .headerSearchPath("Classes/Models"),
                .headerSearchPath("Classes/Utils"),
                .headerSearchPath("Classes/Utils/Categorys"),
                .headerSearchPath("Classes/Utils/Logger"),
                .headerSearchPath("Classes/Views"),
                .headerSearchPath("Classes/Views/Metal"),
                .headerSearchPath("Classes/Views/Metal/Vapx"),
                .headerSearchPath("Classes/Views/OpenGL"),
                .headerSearchPath("Shaders")
            ],
            linkerSettings: [
                .linkedFramework("Metal"),
                .linkedFramework("MetalKit")
            ]
        )
    ]
)
