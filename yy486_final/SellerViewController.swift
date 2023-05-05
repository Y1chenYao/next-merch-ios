//
//  SellerViewController.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-05-04.
//

import UIKit

class SellerViewController: UIViewController{
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    //palatte
    let purple = UIColor(red: 0.44, green: 0.41, blue: 0.95, alpha: 1.00)
    let mildBlue = UIColor(red: 0.46, green: 0.56, blue: 0.97, alpha: 1.00)
    //components
    let welcomeLabel = UILabel()
    let orderTableView = UITableView()
    let segmentControl = UISegmentedControl(items:["All","Pending","PickedUp"])
    let orderReuseIdentifier = "orderReuseIdentifier-sell"

    let refreshControl = UIRefreshControl()
    var shownOrderData: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        welcomeLabel.textColor = purple
        welcomeLabel.text = "Customer Orders"
        view.addSubview(welcomeLabel)
        
        segmentControl.layer.cornerRadius = 5.0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentControl)
        
        orderTableView.translatesAutoresizingMaskIntoConstraints = false
        orderTableView.separatorStyle = .none
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.register(SellerTableViewCell.self, forCellReuseIdentifier: orderReuseIdentifier)
        view.addSubview(orderTableView)
        
        initiateData()
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant:10),
            segmentControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            orderTableView.topAnchor.constraint(equalTo:segmentControl.bottomAnchor, constant: 10),
            orderTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            orderTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            orderTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func initiateData() {
//        NetworkManager.shared.getAllMessages { messages in
//            DispatchQueue.main.async {
//                self.shownmerchData = messages
//                self.merchTableView.reloadData()
//            }
//        }
        
        let order01 = Order(id:1, mid: 1, bid:1, notes:"@hello-world",num:1, pickedUp: false, paid: false)
        let order02 = Order(id:2, mid: 2, bid:1, notes:"@goodbye-world",num:1, pickedUp: true, paid: true)
        
        self.shownOrderData = [order01, order02]
        self.orderTableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SellerViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // this will turn on `masksToBounds` just before showing the cell
        cell.contentView.layer.masksToBounds = true
    }
}

extension SellerViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownOrderData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: orderReuseIdentifier, for: indexPath) as! SellerTableViewCell
        let orderObject = shownOrderData[indexPath.row]
        cell.configure(orderObject: orderObject)
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
