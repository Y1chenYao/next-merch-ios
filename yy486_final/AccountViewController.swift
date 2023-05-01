//
//  AccountViewController.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-05-01.
//

import Foundation
import UIKit

class AccountViewController: UIViewController {
    let gradient: CAGradientLayer = CAGradientLayer()
    let mildPurple = UIColor(red: 0.77, green: 0.87, blue: 0.96, alpha: 1.00)
    let purple = UIColor(red: 0.44, green: 0.41, blue: 0.95, alpha: 1.00)
    let welcomeLabel = UILabel()
    let userLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        gradient.colors = [mildPurple.cgColor, UIColor.white.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1) // you need to play with 0.15 to adjust gradient vertically
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        
        UserDefaults.standard.set("Ashton", forKey: "username") //placeholder
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        let name = UserDefaults.standard.string(forKey: "username")
        welcomeLabel.text = "Welcome back, "
        view.addSubview(welcomeLabel)
        
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.text = (name ?? "Null")
        userLabel.textColor = purple
        userLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        view.addSubview(userLabel)
        
        setupConstraints()
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 5),
            userLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
        
    }
}
