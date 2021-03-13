# UltraKit
Library for rapid prototyping of the UICollectionView layout

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate UltraKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'UltraKit', '~> 0.0.1'
end
```

Then, run the following command:

```bash
$ pod install
```

### Swift Package Manager

Swift Package Manager is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate UltraKit into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/sergeyshalnov/UltraKit.git", .upToNextMajor(from: "0.0.2"))
]
```
