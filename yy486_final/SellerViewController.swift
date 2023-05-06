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
//    let segmentControl = UISegmentedControl(items:["All","Pending","PickedUp"])
    let orderReuseIdentifier = "orderReuseIdentifier-sell"

    let refreshControl = UIRefreshControl()
    
    var merchList:[Merch] = []
    var shownOrderData: [Order] = []
    
    override func viewDidLoad() {
        
        let order01 = Order(id:1, mid: 1, bid:1, notes:"@hello-world",num:1, pickedUp: false, paid: false)
        let order02 = Order(id:2, mid: 2, bid:1, notes:"@goodbye-world",num:1, pickedUp: true, paid: true)
        let _ = [order01, order02]
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        welcomeLabel.textColor = purple
        welcomeLabel.text = "Customer Orders"
        view.addSubview(welcomeLabel)
        
//        segmentControl.layer.cornerRadius = 5.0
//        segmentControl.translatesAutoresizingMaskIntoConstraints = false
//        segmentControl.addTarget(self, action: #selector(alterSorting),for: .valueChanged)
//        view.addSubview(segmentControl)
        
        orderTableView.translatesAutoresizingMaskIntoConstraints = false
        orderTableView.separatorStyle = .none
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.register(SellerTableViewCell.self, forCellReuseIdentifier: orderReuseIdentifier)
        view.addSubview(orderTableView)
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)

        if #available(iOS 10.0, *) {
            orderTableView.refreshControl = refreshControl
        } else {
            orderTableView.addSubview(refreshControl)
        }
        
        initiateData()
        setupConstraints()
    }
    
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        ])
        
//        NSLayoutConstraint.activate([
//            segmentControl.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant:10),
//            segmentControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//        ])
        
        NSLayoutConstraint.activate([
            orderTableView.topAnchor.constraint(equalTo:welcomeLabel.bottomAnchor, constant: 10),
            orderTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            orderTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            orderTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func initiateData() {
        NetworkManager.shared.getSellerMerch(){ merch in
            DispatchQueue.main.async {
                for m in merch{
                    NetworkManager.shared.getOrderByMid(merch_id: m.id){ orders in
                        DispatchQueue.main.async{
                            self.shownOrderData = self.shownOrderData+orders
                            self.orderTableView.reloadData()
                        }
                    }
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func refreshData() {
        shownOrderData = []
        NetworkManager.shared.getSellerMerch(){ merch in
            DispatchQueue.main.async {
                for m in merch{
                    NetworkManager.shared.getOrderByMid(merch_id: m.id){ orders in
                        DispatchQueue.main.async{
                            self.shownOrderData = self.shownOrderData+orders
                            self.orderTableView.reloadData()
                        }
                    }
                }
            }
        }
        self.refreshControl.endRefreshing()
    }
    
    @objc func alterSorting(_ sender: UISegmentedControl) {
        var original:[Order] = []
        NetworkManager.shared.getSellerMerch(){ merch in
            DispatchQueue.main.async {
                for m in merch{
                    NetworkManager.shared.getOrderByMid(merch_id: m.id){ orders in
                        DispatchQueue.main.async{
                            original = original+orders
                        }
                    }
                }
                switch sender.selectedSegmentIndex {
                case 1:
                    let filtered = original.filter { order in
                        return !order.paid
                    }
                    self.shownOrderData = filtered
                    self.orderTableView.reloadData()

                case 2:
                    let filtered = original.filter { order in
                        return !order.pickedUp
                    }
                    self.shownOrderData = filtered
                    self.orderTableView.reloadData()
                default:
                    self.refreshData()
                }
            }
        }
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
