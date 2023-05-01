//
//  CreateOrderViewController.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-04-30.
//

import Foundation
import UIKit

class CreateOrderViewController: UIViewController {
    
    let messageTextView = UITextView()
    let posterTextField = UITextField()
    let saveButton = UIButton()
    
    weak var delegate: CreateOrderDelegate?
    var merch: Merch?
    
    init(merch:Merch, delegate: CreateOrderDelegate) {
        self.delegate = delegate
        self.merch = merch
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        messageTextView.text = "placeholder"
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        messageTextView.clipsToBounds = true
        messageTextView.layer.cornerRadius = 5
        messageTextView.backgroundColor = .systemGray4
        messageTextView.font = .systemFont(ofSize: 15)
        view.addSubview(messageTextView)

        posterTextField.placeholder = "placeholder"
        posterTextField.translatesAutoresizingMaskIntoConstraints = false
        posterTextField.clipsToBounds = true
        posterTextField.layer.cornerRadius = 5
        posterTextField.backgroundColor = .systemGray4
        posterTextField.font = .systemFont(ofSize: 20)
        view.addSubview(posterTextField)

        saveButton.setTitle("Save", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = .systemBlue
        saveButton.layer.cornerRadius = 15
        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        view.addSubview(saveButton)

        setupConstraints()
    }
    
    @objc func saveAction() {
//        let body = messageTextView.text!
//        let poster = posterTextField.text!
        print("not implemented")
    }
    

    func setupConstraints() {
        let widthMultiplier: CGFloat = 0.75

        NSLayoutConstraint.activate([
            messageTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            messageTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier),
            messageTextView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            posterTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterTextField.topAnchor.constraint(equalTo: messageTextView.bottomAnchor, constant: 20),
            posterTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier)
        ])

        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




protocol CreateOrderDelegate: UIViewController {
    //buyerid stored locally
    func createOrder(merchid:Int, buyerNote: String, numberItems: Int)
}









class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 5,
        left: 10,
        bottom: 5,
        right: 10
    )
    
    //Add paddings for UITextField requires overriding the class
    //https://www.advancedswift.com/uitextfield-with-padding-swift/
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    //Add bottom border for UITextField
    //https://gist.github.com/29satnam/5e88bc9203b04b68296d23b85a14efe1
    var bottomBorder = UIView()
    override func awakeFromNib() {
        self.translatesAutoresizingMaskIntoConstraints = false
        bottomBorder = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bottomBorder.backgroundColor = UIColor(red: 0.45, green: 0.97, blue: 0.81, alpha: 1.00)
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomBorder)
        bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomBorder.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomBorder.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bottomBorder.heightAnchor.constraint(equalToConstant: 1).isActive = true // Set Border-Strength
    }
}





