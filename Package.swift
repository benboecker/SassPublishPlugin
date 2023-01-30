// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "SassPublishPlugin",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "SassPublishPlugin",
            targets: ["SassPublishPlugin"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.1.0"),
		.package(url: "https://github.com/johnfairh/swift-sass.git", from: "1.6.0"),
	],
    targets: [
        .target(
            name: "SassPublishPlugin",
            dependencies: [
				.product(name: "Publish", package: "publish"),
				.product(name: "DartSass", package: "swift-sass"),
			]
        ),
    ]
)
