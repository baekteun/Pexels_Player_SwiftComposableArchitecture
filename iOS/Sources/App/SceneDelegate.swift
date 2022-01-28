//
//  SceneDelegate.swift
//  TCAGithubSearch
//
//  Created by Kang Min Ahn on 2020/05/15.
//  Copyright © 2020 kangmin. All rights reserved.
//

import UIKit
import ComposableArchitecture
import SwiftUI
import Service

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: VideoListView(store: Store(
                initialState: VideoListState(),
                reducer: videoListReducer.debug(),
                environment: VideoListEnvironment(
                    pexelsClient: .live,
                    mainQueue: .main.eraseToAnyScheduler())
            ))
            )
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

