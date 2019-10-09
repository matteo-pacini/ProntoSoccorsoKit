
import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            let regionListVC = RegionListViewController(nibName: nil, bundle: nil)
            RegionListConfigurator.configure(viewController: regionListVC)
            let regionListNC = UINavigationController(rootViewController: regionListVC)

            window.rootViewController = regionListNC
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}
