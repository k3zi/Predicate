// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "Predicate",
    products: [
        .library(
            name: "Predicate",
            targets: ["Predicate"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Predicate",
            dependencies: []
        ),
        .testTarget(
            name: "PredicateTests",
            dependencies: ["Predicate"]
        ),
    ]
)
