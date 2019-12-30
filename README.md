
UIVVMaterialComponent
======

[![Build Status](https://travis-ci.org/ishkawa/APIKit.svg?branch=master)](https://travis-ci.org/ishkawa/APIKit)
[![codecov](https://codecov.io/gh/ishkawa/APIKit/branch/master/graph/badge.svg)](https://codecov.io/gh/ishkawa/APIKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/UIVVMaterialComponent.svg?style=flat)](http://cocoadocs.org/docsets/UIVVMaterialComponent)
[![Platform](https://img.shields.io/cocoapods/p/UIVVMaterialComponent.svg?style=flat)](http://cocoadocs.org/docsets/UIVVMaterialComponent)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

Material Components for iOS 

```swift
      First import UIVVMaterialComponent in your swift file
      
      import UIVVMaterialComponent
      
      and then in your viewDidLoad create it 

      override func viewDidLoad() {
        super.viewDidLoad()
    
        let spinner = UIVVMaterialSpinner.init()
        spinner.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        spinner.beginRefreshing()
        self.view.addSubview(spinner)
            
    }

```

## Requirements

- Swift 4.2 or later
- iOS 11.0 or later


## Installation

#### [CocoaPods](https://github.com/cocoapods/cocoapods)

- Insert `pod 'UIVVMaterialComponent', '~> 0.5.1'` to your Podfile.
- Run `pod install`.

Note: CocoaPods 1.4.0 is required to install UIVVMaterialComponent.

## Documentation

- [Getting started](Documentation/GettingStarted.md)



