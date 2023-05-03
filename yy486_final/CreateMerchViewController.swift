//
//  CreateMerchViewController.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-05-01.
//

import Foundation
import UIKit

class CreateMerchViewController: UIViewController {
    let orderLabel = UILabel()
    let merchLabel = UILabel()
    let descrView = UITextView()
    let priceLabel = UILabel()
    let dateLabel = UILabel()
    let placeLabel = UILabel()
    let infoLabel = UILabel()
    let numberLabel = UILabel()
    let numberField = TextFieldWithPadding()
    let noteLabel = UILabel()
    let noteField = TextFieldWithPadding()
    let tipView = UITextView()
    
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
        
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        dateLabel.text = "Pickup Time: "+(merch?.pickupTime)!
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        placeLabel.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        placeLabel.text = "Pickup Place: "+(merch?.pickupPlace)!
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        numberLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        numberLabel.text = "How many are you ordering?"
        numberLabel.textColor = mildBlue
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        numberField.placeholder = "Enter a number"
        numberField.layer.cornerRadius = 20.0
        numberField.layer.borderWidth = 1.0
        numberField.layer.borderColor = UIColor.lightGray.cgColor
        numberField.backgroundColor = UIColor.white
        numberField.font = .systemFont(ofSize: 15)
        numberField.translatesAutoresizingMaskIntoConstraints = false
        
        noteLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        noteLabel.text = "How are you going to pay?"
        noteLabel.textColor = mildBlue
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        noteField.placeholder = "Enter your venmo handle"
        noteField.layer.cornerRadius = 20.0
        noteField.layer.borderWidth = 1.0
        noteField.layer.borderColor = UIColor.lightGray.cgColor
        noteField.backgroundColor = UIColor.white
        noteField.font = .systemFont(ofSize: 15)
        noteField.translatesAutoresizingMaskIntoConstraints = false
        
        descrView.font = UIFont.systemFont(ofSize: 14)
        descrView.translatesAutoresizingMaskIntoConstraints = false
        descrView.text = merch?.description
        descrView.isScrollEnabled = false
        descrView.isEditable = false
        descrView.backgroundColor = .clear
        descrView.textContainer.lineFragmentPadding = 0;
        
        tipView.font = UIFont.systemFont(ofSize: 12)
        tipView.textColor = .gray
        tipView.translatesAutoresizingMaskIntoConstraints = false
        tipView.text = "*This app will not make any transactions. You need to venmo the merchant on your own. If the merchant received the money, your order will be updated as \"payment verified\"."
        tipView.isScrollEnabled = false
        tipView.isEditable = false
        tipView.backgroundColor = .clear
        tipView.textContainer.lineFragmentPadding = 0;
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight:.heavy)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = purple
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        
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
        stackView.addArrangedSubview(numberLabel)
        stackView.addArrangedSubview(numberField)
        stackView.addArrangedSubview(noteLabel)
        stackView.addArrangedSubview(noteField)
        stackView.addArrangedSubview(tipView)
        
        view.addSubview(stackView)
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
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




protocol CreateMerchDelegate: UIViewController {
    //sellerid stored locally, todo
    func createMerch()
}















