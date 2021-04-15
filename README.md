
UIVVMaterialComponent
======

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/UIVVMaterialComponent.svg?style=flat)](http://cocoadocs.org/docsets/UIVVMaterialComponent)
[![Platform](https://img.shields.io/cocoapods/p/UIVVMaterialComponent.svg?style=flat)](http://cocoadocs.org/docsets/UIVVMaterialComponent)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

Material Components for iOS Swift

```swift

      First import UIVVMaterialComponent

      in your swift file in SceneDelegate. Here is the code snippet


      //
      //  SceneDelegate.swift
      //  Supermarket
      //
      //  Created by Vinod VIshwakarma on 14/03/2021.
      //

      import UIKit
      import UIVVMaterialComponent


      class SceneDelegate: UIResponder, UIWindowSceneDelegate {

          var window: UIWindow?


          func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
              // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
              // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
              // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
              guard let _ = (scene as? UIWindowScene) else { return }
          }

          func sceneDidDisconnect(_ scene: UIScene) {
              // Called as the scene is being released by the system.
              // This occurs shortly after the scene enters the background, or when its session is discarded.
              // Release any resources associated with this scene that can be re-created the next time the scene connects.
              // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
          }

          func sceneDidBecomeActive(_ scene: UIScene) {
              // Called when the scene has moved from an inactive state to an active state.
              // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
          }

          func sceneWillResignActive(_ scene: UIScene) {
              // Called when the scene will move from an active state to an inactive state.
              // This may occur due to temporary interruptions (ex. an incoming phone call).
          }

          func sceneWillEnterForeground(_ scene: UIScene) {
              // Called as the scene transitions from the background to the foreground.
              // Use this method to undo the changes made on entering the background.
          }

          func sceneDidEnterBackground(_ scene: UIScene) {
              // Called as the scene transitions from the foreground to the background.
              // Use this method to save data, release shared resources, and store enough scene-specific state information
              // to restore the scene back to its current state.

              // Save changes in the application's managed object context when the application transitions to the background.
              (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
          }


      }



      
      
      and then in your viewDidLoad create it 

      override func viewDidLoad() {
        super.viewDidLoad()
    
        let spinner = UIVVMaterialSpinner.init()
        spinner.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        spinner.beginRefreshing()
        self.view.addSubview(spinner)
            
    }

```

## Storyboard id use case
```
let loginVC = AppStoryboard.PreLogin
                 .viewController(vcClass: LoginVC.self)

```

## Requirements

- Swift 5.0 or later
- iOS 13.0 or later

## Installation

#### [CocoaPods](https://github.com/cocoapods/cocoapods)

- Insert `pod 'UIVVMaterialComponent', '~> 1.2.2'` to your Podfile.
- Run `pod install`.

Note: CocoaPods 1.4.0 is required to install UIVVMaterialComponent.

## Documentation

- [Getting started](https://htmlpreview.github.io/?https://github.com/vinod1988/UIVVMaterialComponent/blob/master/docs/index.html)



