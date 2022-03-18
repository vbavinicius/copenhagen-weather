//
//  SceneDelegate.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 14/03/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
             guard let windowScene = (scene as? UIWindowScene) else { return }
             let window = UIWindow(windowScene: windowScene)
             let viewController = CityWeatherViewController(viewModel: CityWeatherViewModel())
             let navigation = UINavigationController(rootViewController: viewController)
             window.rootViewController = navigation
             self.window = window
             window.makeKeyAndVisible()
    }
}

