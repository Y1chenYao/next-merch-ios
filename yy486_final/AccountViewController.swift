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
    let mildBlue = UIColor(red: 0.71, green: 0.87, blue: 0.94, alpha: 1.00)
    let mildPink = UIColor(red: 0.96, green: 0.76, blue: 0.96, alpha: 1.00)
    let mildPurple = UIColor(red: 0.77, green: 0.65, blue: 0.98, alpha: 1.00)
    let purple = UIColor(red: 0.44, green: 0.41, blue: 0.95, alpha: 1.00)
    let blue = UIColor(red: 0.49, green: 0.47, blue: 0.96, alpha: 1.00)
    let blurWhite = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.6)
    
    let welcomeLabel = UILabel()
    let userLabel = UILabel()
    
  
    let stackView01 = UIStackView()
    let stackView02 = UIStackView()
    let stackView03 = UIStackView()
    let logoutButton = UIButton()
    
    let titleLabel01 = UILabel()
    let titleLabel02 = UILabel()
    let titleLabel03 = UILabel()
    let button01 = UIButton()
    let button02 = UIButton()
    let button03 = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        gradient.colors = [mildBlue.cgColor, mildPurple.cgColor, mildPink.cgColor]
        gradient.locations = [0.0,0.7, 1]
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
        
        //BOX 1
        let myLabel01:UILabel = UILabel(frame: CGRectMake(7, 200, 370, 100))
        myLabel01.lineBreakMode = NSLineBreakMode.byWordWrapping
        myLabel01.numberOfLines = 0
        myLabel01.text = "View my\nmerch purchases"
        myLabel01.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        myLabel01.translatesAutoresizingMaskIntoConstraints = false
        
        button01.setTitle("GO", for: .normal)
        button01.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button01.setTitleColor(.white, for: .normal)
        button01.backgroundColor = blue
        button01.layer.cornerRadius = 15
        button01.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button01.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        
        stackView01.translatesAutoresizingMaskIntoConstraints = false
        stackView01.alignment = .leading
        stackView01.distribution = .equalSpacing
        stackView01.axis = .vertical
        stackView01.customize(backgroundColor: blurWhite, radiusSize: 8)
        stackView01.layoutMargins = UIEdgeInsets(top: 35, left: 170, bottom: 35, right: 0)
        stackView01.isLayoutMarginsRelativeArrangement = true
        
        let imageView01 = UIImageView(frame: CGRect(x: 20, y: 15, width: 130, height: 130))
        let image01 = UIImage(named: "svg-a1")
        imageView01.image = image01
        stackView01.addSubview(imageView01)
        stackView01.addArrangedSubview(myLabel01)
        stackView01.addArrangedSubview(button01)
        
        //BOX 2
        let myLabel02:UILabel = UILabel(frame: CGRectMake(7, 200, 370, 100))
        myLabel02.lineBreakMode = NSLineBreakMode.byWordWrapping
        myLabel02.numberOfLines = 0
        myLabel02.text = "View orders\nfrom customers"
        myLabel02.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        myLabel02.translatesAutoresizingMaskIntoConstraints = false
        
        button02.setTitle("GO", for: .normal)
        button02.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button02.setTitleColor(.white, for: .normal)
        button02.backgroundColor = blue
        button02.layer.cornerRadius = 15
        button02.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button02.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        
        stackView02.translatesAutoresizingMaskIntoConstraints = false
        stackView02.alignment = .leading
        stackView02.distribution = .equalSpacing
        stackView02.axis = .vertical
        stackView02.customize(backgroundColor: blurWhite, radiusSize: 8)
        stackView02.layoutMargins = UIEdgeInsets(top: 35, left: 170, bottom: 35, right: 0)
        stackView02.isLayoutMarginsRelativeArrangement = true
        
        let imageView02 = UIImageView(frame: CGRect(x: 20, y: 30, width: 130, height: 90))
        let image02 = UIImage(named: "svg-a2")
        imageView02.image = image02
        stackView02.addSubview(imageView02)
        stackView02.addArrangedSubview(myLabel02)
        stackView02.addArrangedSubview(button02)
        
        //BOX 3
        let myLabel03:UILabel = UILabel(frame: CGRectMake(7, 200, 370, 100))
        myLabel03.lineBreakMode = NSLineBreakMode.byWordWrapping
        myLabel03.numberOfLines = 0
        myLabel03.text = "Create merch\nfor sale"
        myLabel03.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        myLabel03.translatesAutoresizingMaskIntoConstraints = false
        
        button03.setTitle("GO", for: .normal)
        button03.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button03.setTitleColor(.white, for: .normal)
        button03.backgroundColor = blue
        button03.layer.cornerRadius = 15
        button03.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button03.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        
        stackView03.translatesAutoresizingMaskIntoConstraints = false
        stackView03.alignment = .leading
        stackView03.distribution = .equalSpacing
        stackView03.axis = .vertical
        stackView03.customize(backgroundColor: blurWhite, radiusSize: 8)
        stackView03.layoutMargins = UIEdgeInsets(top: 35, left: 170, bottom: 35, right: 0)
        stackView03.isLayoutMarginsRelativeArrangement = true
        
        let imageView03 = UIImageView(frame: CGRect(x: 20, y: 15, width: 130, height: 130))
        let image03 = UIImage(named: "svg-a3")
        imageView03.image = image03
        stackView03.addSubview(imageView03)
        stackView03.addArrangedSubview(myLabel03)
        stackView03.addArrangedSubview(button03)
        
        
        //FOOTER
        let logoutRed = UIColor(red: 0.97, green: 0.38, blue: 0.42, alpha: 1.00)
        logoutButton.setTitle("Log me out", for: .normal)
        logoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight:.heavy)
        logoutButton.setTitleColor(logoutRed, for: .normal)
        logoutButton.backgroundColor = blurWhite
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.layer.cornerRadius = 10
        logoutButton.addTarget(self, action: #selector(createMerch), for: .touchUpInside)
        
        view.addSubview(stackView01)
        view.addSubview(stackView02)
        view.addSubview(stackView03)
        view.addSubview(logoutButton)
        
        setupConstraints()
    }
    
    @objc func saveAction() {
//        let body = messageTextView.text!
//        let poster = posterTextField.text!
        print("logout not implemented")
    }
    
    @objc func createMerch(){
        present(CreateMerchViewController(),animated: true)
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
            stackView01.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackView01.heightAnchor.constraint(equalToConstant: 150),
            stackView01.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            stackView02.topAnchor.constraint(equalTo: stackView01.bottomAnchor, constant: 20),
            stackView02.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackView02.heightAnchor.constraint(equalToConstant: 150),
            stackView02.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            stackView03.topAnchor.constraint(equalTo: stackView02.bottomAnchor, constant: 20),
            stackView03.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackView03.heightAnchor.constraint(equalToConstant: 150),
            stackView03.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            logoutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            logoutButton.topAnchor.constraint(equalTo: stackView03.bottomAnchor, constant: 20),
            logoutButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
    }
}
