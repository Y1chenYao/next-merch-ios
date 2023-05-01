//
//  ViewController.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-04-30.
//

import UIKit


class ViewController: UIViewController {

    let welcomeLabel = UILabel()
    let merchTableView = UITableView()
    let merchReuseIdentifier = "merchReuseIdentifier"

    let addMessageButton = UIBarButtonItem()
    let refreshControl = UIRefreshControl()
    let purple = UIColor(red: 0.44, green: 0.41, blue: 0.95, alpha: 1.00)

    var shownMerchData: [Merch] = []
    

    override func viewDidLoad() {
//        var url = URL(string: "http://34.85.172.228/")!
//        let formatParameter = URLQueryItem(name: "format", value: "json")
//        url.append(queryItems: [formatParameter])

        super.viewDidLoad()
        view.backgroundColor = .white
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        welcomeLabel.textColor = purple
        welcomeLabel.text = "On Sale"
        view.addSubview(welcomeLabel)

        merchTableView.translatesAutoresizingMaskIntoConstraints = false
        merchTableView.separatorStyle = .none
        merchTableView.delegate = self
        merchTableView.dataSource = self
        merchTableView.register(MerchTableViewCell.self, forCellReuseIdentifier: merchReuseIdentifier)
        view.addSubview(merchTableView)

        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)

        if #available(iOS 10.0, *) {
            merchTableView.refreshControl = refreshControl
        } else {
            merchTableView.addSubview(refreshControl)
        }

        initiateData()
        setupConstraints()
        
        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
        
        NSLayoutConstraint.activate([
            merchTableView.topAnchor.constraint(equalTo:welcomeLabel.bottomAnchor, constant: 10),
            merchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            merchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            merchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func initiateData() {
//        NetworkManager.shared.getAllMessages { messages in
//            DispatchQueue.main.async {
//                self.shownmerchData = messages
//                self.merchTableView.reloadData()
//            }
//        }
        let merch01 = Merch(id:1, sid: 1, name: "Matcha Cookie", generalType: "Food", description: "Matcha Cookies are soft and chewy sugar cookies with a beautiful bright matcha green tea flavor.", price: 3, pickupTime: "Apr30 1-5pm", pickupPlace: "Upson Hall")
        let merch02 = Merch(id:2, sid: 1, name: "Splatoon T-shirt", generalType: "Clothing", description: "A special collection developed in collaboration with the beloved shooter game franchise, \"Splatoon,\" to feature its latest title.", price: 25, pickupTime: "May13 1-5pm", pickupPlace: "Willard Straight Hall")
        let merch03 = Merch(id:3, sid:2, name: "Mystery Show", generalType: "Ticket", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", price: 25, pickupTime: "May13 1-5pm", pickupPlace: "online")
        self.shownMerchData = [merch01, merch02,merch03, merch02,merch01, merch02]
        self.merchTableView.reloadData()
    }

    @objc func refreshData() {
//        NetworkManager.shared.getAllMerch { allMerch in
//            DispatchQueue.main.async {
//                self.shownMerchData = allMerch
//                self.merchTableView.reloadData()
//                self.refreshControl.endRefreshing()
//            }
//        }
        self.refreshControl.endRefreshing()
    }


//    @objc func pushMerchView() {
//        navigationController?.pushViewController(CreateMerchViewController(delegate: self), animated: true)
//    }

    func presentView(merch:Merch) {
        present(CreateOrderViewController(merch:merch,delegate:self),animated: true)
    }
}


extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMerch = shownMerchData[indexPath.row]
        presentView(merch:selectedMerch)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // this will turn on `masksToBounds` just before showing the cell
        cell.contentView.layer.masksToBounds = true
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownMerchData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: merchReuseIdentifier, for: indexPath) as! MerchTableViewCell
        let merchObject = shownMerchData[indexPath.row]
        cell.configure(merchObject: merchObject)
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension ViewController: CreateOrderDelegate {
    func createOrder(merchid:Int, buyerNote:String, numberItems:Int) {
        //TODO add buyerid from local
//        NetworkManager.shared.createOrder(merchid:Int, buyerNote:String, numberItems:Int) { merch in
//            print("successfully created a new post")
//            self.refreshData()
//        }
    }
}

//extension ViewController: UpdateMessageDelegate {
//    func updateMessage(message: String, sender: String, tnetid: String, id: Int) {
//        NetworkManager.shared.updateMessage(body: message, sender: sender, tnetid: tnetid, id: id, completion: {message in
//            print("successfully updated the post")
//            self.refreshData()
//        })
//    }
//}







