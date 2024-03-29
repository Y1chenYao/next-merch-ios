//
//  CreateMerchViewController.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-05-01.
//

import Foundation
import UIKit

extension UITextView {
    func leftSpace() {
        self.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

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
    let segmentItems = ["Food","Clothing","Show","Concert","Other"]
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
        noteLabel.text = "What is your venmo handle"
        noteLabel.textColor = purple
        noteLabel.translatesAutoresizingMaskIntoConstraints = false

        noteField.placeholder = "e.g. @Hello-world"
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
        descrView.text = ""
        descrView.isScrollEnabled = false
        descrView.isEditable = true
        descrView.backgroundColor = .clear
        descrView.layer.borderColor = UIColor.lightGray.cgColor
        descrView.layer.borderWidth = 1.0
        descrView.layer.cornerRadius = 5.0
        descrView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        descrView.leftSpace()
        
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
    
    @objc func showAlertButtonTapped(_ customTitle: String, _ customMessage: String) {
        let alert = UIAlertController(title: customTitle, message: customMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
    @objc func saveAction() {
        let name = merchField.text!
        let p:Int? = Int(priceField.text!)
        var general_type = "Other"
        if (segmentControl.selectedSegmentIndex != -1){
            general_type = segmentItems[segmentControl.selectedSegmentIndex]
        }
        let note = noteField.text!
        let time = timeField.text!
        let place = placeField.text!
        let descr = descrView.text!

        if let price = p{
            if(!name.isEmpty && !note.isEmpty && !time.isEmpty && !place.isEmpty && !descr.isEmpty){
                let description = descr + "(Venmo: " + note + ")"
                NetworkManager.shared.createMerch(price: price, name: name, general_type: general_type, description: description, pick_up_time: time, pick_up_place: place) { (result:Result<Merch, Error>) in
                    switch result{
                        case .success(_):
                            DispatchQueue.main.async {
                                self.showAlertButtonTapped("Success","Your merch is successfully added to the market")
                            }
                        case .failure(_):
                            DispatchQueue.main.async {
                                self.showAlertButtonTapped("Failure","Error occurred on the server")
                            }
                        }
                }
            }else{
                self.showAlertButtonTapped("Input error","Please fill in all fields")
            }
        }
        else{
            self.showAlertButtonTapped("Input error","Please enter a valid integer for price")
        }
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



















