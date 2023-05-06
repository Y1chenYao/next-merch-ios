//
//  LoginViewController.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-05-04.
//

import UIKit

class LoginController: UIViewController{
    
    let gradient: CAGradientLayer = CAGradientLayer()
    let mildBlue = UIColor(red: 0.71, green: 0.87, blue: 0.94, alpha: 1.00)
    let mildPink = UIColor(red: 0.96, green: 0.76, blue: 0.96, alpha: 1.00)
    let mildPurple = UIColor(red: 0.77, green: 0.65, blue: 0.98, alpha: 1.00)
    let mint = UIColor(red: 0.45, green: 0.97, blue: 0.81, alpha: 1.00)
    let purple = UIColor(red: 0.44, green: 0.41, blue: 0.95, alpha: 1.00)
    let serviceRed = UIColor(red: 0.97, green: 0.38, blue: 0.42, alpha: 1.00)
    
    let welcomeLabel01 = UILabel()
    let welcomeLabel02 = UILabel()
    let submitButton = UIButton()
    let signupButton = UIButton()
    let idField = TextFieldWithPadding()
    let pwField = TextFieldWithPadding()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient.colors = [mildBlue.cgColor, mildPurple.cgColor, mildPink.cgColor]
        gradient.locations = [0.0,0.7, 1]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1) // you need to play with 0.15 to adjust gradient vertically
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        
        welcomeLabel01.text = "Login to"
        welcomeLabel01.textColor = .white
        welcomeLabel01.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel01.font = .boldSystemFont(ofSize: 30)
        view.addSubview(welcomeLabel01)
        
        welcomeLabel02.text = "Unlock your Next Merch"
        welcomeLabel02.textColor = .white
        welcomeLabel02.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel02.font = .boldSystemFont(ofSize: 25)
        view.addSubview(welcomeLabel02)
        
        idField.placeholder = "Enter user id"
        idField.layer.cornerRadius = 20.0
        idField.autocapitalizationType = .none
        idField.backgroundColor = UIColor.white
        idField.font = .systemFont(ofSize: 15)
        idField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(idField)
        
        pwField.placeholder = "Enter password"
        pwField.layer.cornerRadius = 20.0
        pwField.autocapitalizationType = .none
        pwField.backgroundColor = UIColor.white
        pwField.font = .systemFont(ofSize: 15)
        pwField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pwField)
        
        submitButton.setTitle("Login", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        submitButton.layer.cornerRadius = 15
        submitButton.backgroundColor = purple
        view.addSubview(submitButton)
        
        signupButton.setTitle("Sign Up", for: .normal)
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        signupButton.layer.cornerRadius = 15
        signupButton.layer.borderWidth = 1
        signupButton.layer.borderColor = UIColor.white.cgColor
        view.addSubview(signupButton)

        setupConstraints()
        
    }
    
    @objc func showAlertButtonTapped(_ customTitle: String, _ customMessage: String) {
        let alert = UIAlertController(title: customTitle, message: customMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func login(){
        if let username = idField.text, let password = pwField.text{
            if (!username.isEmpty && !password.isEmpty){
                NetworkManager.shared.verifyUser(username: username, password:password) { (result: Result<User, Error>) in
                    switch result{
                    case .success(let user):
                        DispatchQueue.main.async {
                            UserDefaults.standard.set(true, forKey: "login")
                            UserDefaults.standard.set(user.id, forKey: "uid")
                            UserDefaults.standard.set(user.username, forKey:"username")
                            self.switchView()
                        }
                    case .failure(_):
                        DispatchQueue.main.async {
                            self.showAlertButtonTapped("Login Failure","Wrong username + password combination")
                        }
                    }
                }
            }else{
                self.showAlertButtonTapped("Oops","Please fill in both fields")
            }
        }
        
    }
    
    @objc func signUp(){
        if let username = idField.text, let password = pwField.text{
            if (!username.isEmpty && !password.isEmpty){
                NetworkManager.shared.createUser(username: username, password:password) { (result: Result<User, Error>) in
                    switch result{
                    case .success(let user):
                        DispatchQueue.main.async {
                            UserDefaults.standard.set(true, forKey: "login")
                            UserDefaults.standard.set(user.id, forKey: "uid")
                            UserDefaults.standard.set(user.username, forKey:"username")
                            self.switchView()
                        }
                    case .failure(_):
                        DispatchQueue.main.async {
                            self.showAlertButtonTapped("Signup Failure","User name already taken")
                        }
                    }
                }
            }else{
                self.showAlertButtonTapped("Oops","Please fill in both fields")
            }
            
        }
    }
       
    
    func switchView(){
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
        NSLayoutConstraint.activate([
            welcomeLabel01.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            welcomeLabel01.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:20)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel02.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:20),
            welcomeLabel02.topAnchor.constraint(equalTo: welcomeLabel01.bottomAnchor, constant:5)
        ])
        
        NSLayoutConstraint.activate([
            idField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:20),
            idField.topAnchor.constraint(equalTo: welcomeLabel02.bottomAnchor, constant:20),
            idField.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            pwField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:20),
            pwField.topAnchor.constraint(equalTo: idField.bottomAnchor, constant: 10),
            pwField.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            signupButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:20),
            signupButton.topAnchor.constraint(equalTo: pwField.bottomAnchor, constant:20),
            signupButton.widthAnchor.constraint(equalToConstant: 130)
        ])
        
        NSLayoutConstraint.activate([
            submitButton.leadingAnchor.constraint(equalTo: signupButton.trailingAnchor, constant:10),
            submitButton.topAnchor.constraint(equalTo: pwField.bottomAnchor, constant:20),
            submitButton.widthAnchor.constraint(equalToConstant: 130)
        ])
        
    }
}

