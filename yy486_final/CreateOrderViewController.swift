//
//  CreateOrderViewController.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-04-30.
//

import Foundation
import UIKit

class CreateOrderViewController: UIViewController {
    let orderLabel = UILabel()
    let merchLabel = UILabel()
    let descrView = UITextView()
    let priceLabel = UILabel()
    let dateLabel = UILabel()
    let placeLabel = UILabel()
    let infoLabel = UILabel()
    let stackView = UIStackView()
    let saveButton = UIButton()
    
    //palatte
    let purple = UIColor(red: 0.44, green: 0.41, blue: 0.95, alpha: 1.00)
    let mildBlue = UIColor(red: 0.46, green: 0.56, blue: 0.97, alpha: 1.00)
    
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
        
        orderLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        orderLabel.textColor = purple
        orderLabel.text = "Start an Order :)"
        orderLabel.translatesAutoresizingMaskIntoConstraints = false

        merchLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        merchLabel.textColor = purple
        merchLabel.text = merch?.name
        merchLabel.numberOfLines = 0
        merchLabel.translatesAutoresizingMaskIntoConstraints = false

        descrView.font = UIFont.systemFont(ofSize: 15)
        descrView.translatesAutoresizingMaskIntoConstraints = false
        descrView.text = merch?.description
        descrView.isScrollEnabled = false
        descrView.isEditable = false
        descrView.backgroundColor = .clear
        descrView.textContainer.lineFragmentPadding = 0;
        
        priceLabel.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        priceLabel.text = "Price: unknown $"
        if let p = merch?.price {
            // Successfully converted String to Int
            priceLabel.text = "Price: " + String(p) + "$"
        }
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        infoLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        infoLabel.text = "Pickup Info"
        infoLabel.textColor = mildBlue
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        dateLabel.text = "Pickup Time: "+(merch?.pickupTime)!
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        placeLabel.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        placeLabel.text = "Pickup Place: "+(merch?.pickupPlace)!
        placeLabel.translatesAutoresizingMaskIntoConstraints = false

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.axis = .vertical

        stackView.addArrangedSubview(orderLabel)
        stackView.addArrangedSubview(merchLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(descrView)
        stackView.addArrangedSubview(infoLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(placeLabel)
        view.addSubview(stackView)

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
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
//            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
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





