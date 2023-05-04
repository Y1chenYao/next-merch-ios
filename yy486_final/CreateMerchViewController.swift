//
//  CreateMerchViewController.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-05-01.
//

import Foundation
import UIKit



class CreateMerchViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    //palatte
    let purple = UIColor(red: 0.44, green: 0.41, blue: 0.95, alpha: 1.00)
    let mildBlue = UIColor(red: 0.46, green: 0.56, blue: 0.97, alpha: 1.00)
    
    let stackView = UIStackView()
    let saveButton = UIButton()
    
    //form components
    let titleLabel = UILabel()
    let tipView02 = UITextView()
    let merchLabel = UILabel()
    let merchField = TextFieldWithPadding()
    let priceLabel = UILabel()
    let priceField = TextFieldWithPadding()
    let genreLabel = UILabel()
    let segmentControl = UISegmentedControl(items:["Food","Clothing","Show","Concert","Other"])
    let noteLabel = UILabel()
    let noteField = TextFieldWithPadding()
    let tipView = UITextView()
    let dateLabel = UILabel()
    let timeField = TextFieldWithPadding()
    let placeLabel = UILabel()
    let placeField = TextFieldWithPadding()
    let descrLabel = UILabel()
    let descrView = UITextView()
    let scrollView = UIScrollView()
    let whiteSpace = UILabel()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        titleLabel.textColor = purple
        titleLabel.text = "Create New Merch💫"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        tipView02.font = UIFont.systemFont(ofSize: 15)
        tipView02.textColor = .darkGray
        tipView02.translatesAutoresizingMaskIntoConstraints = false
        tipView02.text = "Launch your new merch in no time! All you need to do is to fill out this form. :)"
        tipView02.isScrollEnabled = false
        tipView02.isEditable = false
        tipView02.backgroundColor = .clear
        tipView02.textContainer.lineFragmentPadding = 0;

        merchLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        merchLabel.textColor = purple
        merchLabel.text = "Name"
        merchLabel.translatesAutoresizingMaskIntoConstraints = false
        
        merchField.placeholder = "Enter the product name"
        merchField.layer.cornerRadius = 20.0
        merchField.layer.borderWidth = 1.0
        merchField.layer.borderColor = UIColor.lightGray.cgColor
        merchField.backgroundColor = UIColor.white
        merchField.font = .systemFont(ofSize: 15)
        merchField.translatesAutoresizingMaskIntoConstraints = false

        priceLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        priceLabel.textColor = purple
        priceLabel.text = "Price $ per piece"
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        priceField.placeholder = "Enter a number"
        priceField.layer.cornerRadius = 20.0
        priceField.layer.borderWidth = 1.0
        priceField.layer.borderColor = UIColor.lightGray.cgColor
        priceField.backgroundColor = UIColor.white
        priceField.font = .systemFont(ofSize: 15)
        priceField.translatesAutoresizingMaskIntoConstraints = false
        
        genreLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        genreLabel.textColor = purple
        genreLabel.text = "Select general type"
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        noteLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        noteLabel.text = "Payment Option"
        noteLabel.textColor = purple
        noteLabel.translatesAutoresizingMaskIntoConstraints = false

        noteField.placeholder = "Enter your venmo handle"
        noteField.layer.cornerRadius = 20.0
        noteField.layer.borderWidth = 1.0
        noteField.layer.borderColor = UIColor.lightGray.cgColor
        noteField.backgroundColor = UIColor.white
        noteField.font = .systemFont(ofSize: 15)
        noteField.translatesAutoresizingMaskIntoConstraints = false
        
        tipView.font = UIFont.systemFont(ofSize: 12)
        tipView.textColor = .gray
        tipView.translatesAutoresizingMaskIntoConstraints = false
        tipView.text = "*This app will not make any transactions. You need to put your venmo handle so that the buyers will directly venmo to you."
        tipView.isScrollEnabled = false
        tipView.isEditable = false
        tipView.backgroundColor = .clear
        tipView.textContainer.lineFragmentPadding = 0
        tipView.textContainerInset = UIEdgeInsets.zero
        
        dateLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        dateLabel.text = "Pickup Time"
        dateLabel.textColor = purple
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timeField.placeholder = "e.g. Wednesday, May 3th, 1pm-5pm"
        timeField.layer.cornerRadius = 20.0
        timeField.layer.borderWidth = 1.0
        timeField.layer.borderColor = UIColor.lightGray.cgColor
        timeField.backgroundColor = UIColor.white
        timeField.font = .systemFont(ofSize: 15)
        timeField.translatesAutoresizingMaskIntoConstraints = false
  
        placeLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        placeLabel.text = "Pickup Location"
        placeLabel.textColor = purple
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        placeField.placeholder = "e.g. Duffield Hall, WSH, Statler"
        placeField.layer.cornerRadius = 20.0
        placeField.layer.borderWidth = 1.0
        placeField.layer.borderColor = UIColor.lightGray.cgColor
        placeField.backgroundColor = UIColor.white
        placeField.font = .systemFont(ofSize: 15)
        placeField.translatesAutoresizingMaskIntoConstraints = false
        
        descrLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        descrLabel.text = "Description"
        descrLabel.textColor = purple
        descrLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descrView.font = UIFont.systemFont(ofSize: 14)
        descrView.translatesAutoresizingMaskIntoConstraints = false
        descrView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        descrView.isScrollEnabled = false
        descrView.isEditable = true
        descrView.backgroundColor = .clear
        descrView.layer.borderColor = UIColor.lightGray.cgColor
        descrView.layer.borderWidth = 1.0
        descrView.layer.cornerRadius = 5.0
        descrView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        saveButton.setTitle("Submit", for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight:.heavy)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = purple
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        
        whiteSpace.text = "   "
        whiteSpace.translatesAutoresizingMaskIntoConstraints = false
        
        segmentControl.layer.cornerRadius = 5.0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.axis = .vertical
        
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(tipView02)
        stackView.addArrangedSubview(merchLabel)
        stackView.addArrangedSubview(merchField)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(priceField)
        stackView.addArrangedSubview(genreLabel)
        stackView.addArrangedSubview(segmentControl)
        stackView.addArrangedSubview(noteLabel)
        stackView.addArrangedSubview(tipView)
        stackView.addArrangedSubview(noteField)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(timeField)
        stackView.addArrangedSubview(placeLabel)
        stackView.addArrangedSubview(placeField)
        stackView.addArrangedSubview(descrLabel)
        stackView.addArrangedSubview(descrView)
        stackView.addArrangedSubview(saveButton)
        stackView.addArrangedSubview(whiteSpace)
        
        
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        

        setupConstraints()
    }
    
    @objc func saveAction() {
//        let body = descrView.text!
//        let poster = posterTextField.text!
        print("not implemented")
    }
    

    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            saveButton.widthAnchor.constraint(equalToConstant: 200)
        ])

        NSLayoutConstraint.activate([
            whiteSpace.topAnchor.constraint(equalTo: saveButton.bottomAnchor),
            whiteSpace.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            whiteSpace.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            whiteSpace.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



















