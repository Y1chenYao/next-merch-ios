//
//  ViewController.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-04-30.
//

import UIKit

class ViewController: UIViewController {

    let messageTableView = UITableView()
    let messageReuseIdentifier = "messageReuseIdentifier"

    let addMessageButton = UIBarButtonItem()
    let refreshControl = UIRefreshControl()

    var messagesData: [Message] = []
    var shownMessagesData: [Message] = []

    override func viewDidLoad() {
        var url = URL(string: "http://34.85.172.228/")!
        let formatParameter = URLQueryItem(name: "format", value: "json")
        url.append(queryItems: [formatParameter])

        super.viewDidLoad()
        title = "Message Board"
        view.backgroundColor = .red

        messageTableView.translatesAutoresizingMaskIntoConstraints = false
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.register(MessageTableViewCell.self, forCellReuseIdentifier: messageReuseIdentifier)
        view.addSubview(messageTableView)

        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)

        if #available(iOS 10.0, *) {
            messageTableView.refreshControl = refreshControl
        } else {
            messageTableView.addSubview(refreshControl)
        }

        addMessageButton.image = UIImage(systemName: "plus.message")
        addMessageButton.target = self
        addMessageButton.action = #selector(pushMessageView)
        navigationItem.rightBarButtonItem = addMessageButton

        initiateData()
        setupConstraints()
        
        //only for debugging purposes
        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            messageTableView.topAnchor.constraint(equalTo: view.topAnchor),
            messageTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messageTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func initiateData() {
        NetworkManager.shared.getAllMessages { messages in
            DispatchQueue.main.async {
                self.shownMessagesData = messages
                self.messageTableView.reloadData()
            }
        }
    }

    @objc func refreshData() {
        NetworkManager.shared.getAllMessages { messages in
            DispatchQueue.main.async {
                self.shownMessagesData = messages
                self.messageTableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }


    @objc func pushMessageView() {
        navigationController?.pushViewController(CreateMessageViewController(delegate: self), animated: true)
    }
    
    func presentView(message:Message) {
        present(UpdateMessageViewController(message:message,delegate:self),animated: true)
    }
}


extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMessage = shownMessagesData[indexPath.row]
        presentView(message:selectedMessage)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCell.EditingStyle.delete) {
            let deletedMessage = shownMessagesData[indexPath.row]
            shownMessagesData.remove(at: indexPath.row)
            messageTableView.deleteRows(at: [indexPath], with: .fade)
            if let id = deletedMessage.id {
                NetworkManager.shared.deleteMessage(id: id) { message in
                    print("successfully deleted the post")
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownMessagesData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: messageReuseIdentifier, for: indexPath) as! MessageTableViewCell
        let messageObject = shownMessagesData[indexPath.row]
        cell.configure(messageObject: messageObject)
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension ViewController: CreateMessageDelegate {
    func createMessage(message: String, sender: String, tnetid: String) {
        NetworkManager.shared.createMessage(body: message, sender: sender, tnetid: tnetid) { message in
            print("successfully created a new post")
            self.refreshData()
        }
    }
}

extension ViewController: UpdateMessageDelegate {
    func updateMessage(message: String, sender: String, tnetid: String, id: Int) {
        NetworkManager.shared.updateMessage(body: message, sender: sender, tnetid: tnetid, id: id, completion: {message in
            print("successfully updated the post")
            self.refreshData()
        })
    }
}







