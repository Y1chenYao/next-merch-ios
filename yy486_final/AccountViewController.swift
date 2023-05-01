//
//  AccountViewController.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-05-01.
//

import Foundation
import UIKit

extension UIStackView {
    func customize(backgroundColor: UIColor = .clear, radiusSize: CGFloat = 0) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = backgroundColor
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
        subView.layer.cornerRadius = radiusSize
        subView.layer.masksToBounds = true
        subView.clipsToBounds = true
    }
}

class AccountViewController: UIViewController {
    let gradient: CAGradientLayer = CAGradientLayer()
    let mildPurple = UIColor(red: 0.64, green: 0.67, blue: 0.98, alpha: 1.00)
    let mildPink = UIColor(red: 0.96, green: 0.76, blue: 0.96, alpha: 1.00)
    let purple = UIColor(red: 0.44, green: 0.41, blue: 0.95, alpha: 1.00)
    let welcomeLabel = UILabel()
    let userLabel = UILabel()
    
    let titleLabel01 = UILabel()
    let stackView01 = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        gradient.colors = [mildPurple.cgColor, mildPink.cgColor]
        gradient.locations = [0.0 , 0.9]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1) // you need to play with 0.15 to adjust gradient vertically
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        
        UserDefaults.standard.set("Ashton", forKey: "username") //placeholder
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        let name = UserDefaults.standard.string(forKey: "username")
        welcomeLabel.text = "Welcome back, "
        welcomeLabel.textColor = .white
        view.addSubview(welcomeLabel)
        
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.text = (name ?? "Null")
        userLabel.textColor = .black
        userLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        view.addSubview(userLabel)
        
        titleLabel01.translatesAutoresizingMaskIntoConstraints = false
        titleLabel01.text = "hello"
        
        stackView01.translatesAutoresizingMaskIntoConstraints = false
        stackView01.alignment = .leading
        stackView01.distribution = .equalSpacing
        stackView01.axis = .vertical
        stackView01.customize(backgroundColor: .white, radiusSize: 8)
        
        stackView01.addArrangedSubview(titleLabel01)
        view.addSubview(stackView01)
        
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
        
        NSLayoutConstraint.activate([
            stackView01.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 30),
//            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            stackView01.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackView01.heightAnchor.constraint(equalToConstant: 160),
            stackView01.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
    }
}
