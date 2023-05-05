//
//  SceneDelegate.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-04-30.
//

import UIKit

extension UIImage {
    enum ContentMode {
        case contentFill
        case contentAspectFill
        case contentAspectFit
    }
    
    func resize(withSize size: CGSize, contentMode: ContentMode = .contentAspectFill) -> UIImage? {
        let aspectWidth = size.width / self.size.width
        let aspectHeight = size.height / self.size.height
        
        switch contentMode {
        case .contentFill:
            return resize(withSize: size)
        case .contentAspectFit:
            let aspectRatio = min(aspectWidth, aspectHeight)
            return resize(withSize: CGSize(width: self.size.width * aspectRatio, height: self.size.height * aspectRatio))
        case .contentAspectFill:
            let aspectRatio = max(aspectWidth, aspectHeight)
            return resize(withSize: CGSize(width: self.size.width * aspectRatio, height: self.size.height * aspectRatio))
        }
    }
    
    private func resize(withSize size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, self.scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        //basic
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let purple = UIColor(red: 0.44, green: 0.41, blue: 0.95, alpha: 1.00)
        UINavigationBar.appearance().tintColor = purple
        
        //set up tabBarController
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = purple
        let vc1 = ViewController()
        vc1.tabBarItem.title = "Shop"
        let vc2 = AccountViewController()
        vc2.tabBarItem.title = "Account"
        vc1.tabBarItem.image = UIImage(named: "shop")?.resize(withSize: CGSize(width: 21, height: 21), contentMode: .contentAspectFill)
        vc2.tabBarItem.image = UIImage(named: "account")?.resize(withSize: CGSize(width: 21, height: 21), contentMode: .contentAspectFill)
        tabBarController.viewControllers = [vc1, vc2]
        
        //login
        let login = UserDefaults.standard.bool(forKey: "login")
        if(!login){
            let viewController = LoginController()
            window.rootViewController = UINavigationController(rootViewController: viewController)
            self.window = window
            window.makeKeyAndVisible()
        }else{
            window.rootViewController = UINavigationController(rootViewController:tabBarController)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func setUpViewController(title: String, backgroundColor: UIColor, image: String) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = backgroundColor
        vc.tabBarItem.title = title
        return vc
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
    }


}

