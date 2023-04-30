//
//  NetworkManager.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-04-30.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()

    var url = URL(string: "http://34.85.172.228/messages")!

    //GET all messages
    func getAllMerch(completion: @escaping ([Merch]) -> Void) {
        
        //TODO use the endpoint to retrieve data
        var request=URLRequest(url: url)
        request.httpMethod="GET"
        
        let task=URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(MerchResponse.self, from: data)
                    completion(response.multiMerch)
                }
                catch(let error){
                    print(String(describing: error))
                }
            }
        }
        task.resume()
    }

    //POST a new message
//    func createMessage(body: String, sender: String, tnetid:String, completion: @escaping (Message) -> Void) {
//        var request=URLRequest(url: url)
//        request.httpMethod="POST"
//        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
//        request.setValue("yy486", forHTTPHeaderField: "netid")
//        let body:[String:Any] = [
//            "message":body,
//            "sender":sender,
//            "to": tnetid
//        ]
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
//        let task=URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder()
//                    let response = try decoder.decode(Message.self, from: data)
//                    completion(response)
//                }
//                catch(let error){
//                    print(String(describing: error))
//                }
//            }
//        }
//        task.resume()
//    }
    
    //POST update a message by id
//    func updateMessage(body: String, sender: String, tnetid:String, id:Int, completion: @escaping (Message) -> Void) {
//        var request=URLRequest(url: url)
//        request.httpMethod="POST"
//        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
//        request.setValue("yy486", forHTTPHeaderField: "netid")
//        let body:[String:Any] = [
//            "message":body,
//            "sender":sender,
//            "to": tnetid,
//            "id":id
//        ]
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
//        let task=URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder()
//                    let response = try decoder.decode(Message.self, from: data)
//                    completion(response)
//                }
//                catch(let error){
//                    print(String(describing: error))
//                }
//            }
//        }
//        task.resume()
//    }
    
    //POST delete a message
//    func deleteMessage(id:Int, completion: @escaping (Message) -> Void) {
//        var request=URLRequest(url: url)
//        request.httpMethod="DELETE"
//        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
//        request.setValue("yy486", forHTTPHeaderField: "netid")
//        let body:[String:Any] = [
//            "id":id
//        ]
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
//        let task=URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder()
//                    let response = try decoder.decode(Message.self, from: data)
//                    completion(response)
//                }
//                catch(let error){
//                    print(String(describing: error))
//                }
//            }
//        }
//        task.resume()
//    }

}

