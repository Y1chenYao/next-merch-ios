//
//  LoginViewController.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-05-04.
//

import UIKit

class LoginController: UIViewController{
    
    let welcomeLabel01 = UILabel()
    let welcomeLabel02 = UILabel()
//    let picImageView = UIImageView()
    let submitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        picImageView.image = UIImage(named:"00")
//        picImageView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(picImageView)
        
        welcomeLabel01.text = "Login to"
        welcomeLabel01.textColor = .white
        welcomeLabel01.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel01.font = .boldSystemFont(ofSize: 30)
        view.addSubview(welcomeLabel01)
        
        welcomeLabel02.text = "Unlock your PlaylistDB"
        welcomeLabel02.textColor = .white
        welcomeLabel02.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel02.font = .boldSystemFont(ofSize: 25)
        view.addSubview(welcomeLabel02)
        
        submitButton.setTitle("Login", for: .normal)
        submitButton.setTitleColor(UIColor(red: 0.45, green: 0.97, blue: 0.81, alpha: 1.00), for: .normal)
        submitButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        submitButton.layer.cornerRadius = 10
        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor(red: 0.45, green: 0.97, blue: 0.81, alpha: 1.00).cgColor
        submitButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.addSubview(submitButton)

        setupConstraints()
        
    }
    
    @objc func login(){
        UserDefaults.standard.set(true, forKey: "login")
        
        //this is super inefficient but I don't know what else to do :<
        let purple = UIColor(red: 0.44, green: 0.41, blue: 0.95, alpha: 1.00)
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
        self.view.window!.rootViewController = UINavigationController(rootViewController: tabBarController)
    }
    
    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            picImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            picImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:20)
//        ])
        NSLayoutConstraint.activate([
            welcomeLabel01.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:20),
            welcomeLabel01.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:20)
        ])
        NSLayoutConstraint.activate([
            welcomeLabel02.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:20),
            welcomeLabel02.topAnchor.constraint(equalTo: welcomeLabel01.bottomAnchor, constant:5)
        ])
        NSLayoutConstraint.activate([
            submitButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:20),
            submitButton.topAnchor.constraint(equalTo: welcomeLabel02.bottomAnchor, constant:20)
        ])
        
    }
}

