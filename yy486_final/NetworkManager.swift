//
//  NetworkManager.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-04-30.
//

import Foundation
import SwiftUI

struct User: Codable {
    var id: Int?
    var username: String
}

enum ManagerErrors: Error {
    case invalidResponse
    case invalidStatusCode(Int)
}

class NetworkManager {

    static let shared = NetworkManager()

    var userURL = URL(string: "http://127.0.0.1:8000/users/")!
    var merchURL = URL(string: "http://127.0.0.1:8000/merch/")!
    var orderURL = URL(string: "http://127.0.0.1:8000/orders/")!

    //POST createUser
    //respond with user_id and user_name
    func createUser(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        var request=URLRequest(url: userURL)
        request.httpMethod="POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        let body:[String:Any] = [
            "username":username,
            "password":password
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        let task=URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(User.self, from: data)
                    completion(.success(response))
                }
                catch(let error){
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    //GET verifyUser
    //respond with user_id and user_name
    func verifyUser(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        var request=URLRequest(url: userURL)
        request.httpMethod="GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.setValue(username, forHTTPHeaderField: "username")
        request.setValue(password, forHTTPHeaderField: "password")
        
        let task=URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(User.self, from: data)
                    completion(.success(response))
                }
                catch(let error){
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    //GET username
    //respond with user_name, require parseint
    func getUserName(id: Int, completion: @escaping (Result<User, Error>) -> Void) {
        var request=URLRequest(url: userURL)
        request.httpMethod="GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.setValue(String(id), forHTTPHeaderField: "id")
        
        let task=URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(User.self, from: data)
                    completion(.success(response))
                }
                catch(let error){
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    //POST create merch
    func createMerch(price:Int, name: String, general_type: String, description:String, pick_up_time:String, pick_up_place:String, completion: @escaping (Result<Merch, Error>) -> Void) {
        var request=URLRequest(url: merchURL)
        request.httpMethod="POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        let body:[String:Any] = [
            "price":price,
            "name":name,
            "general_type":general_type,
            "description":description,
            "pick_up_time":pick_up_time,
            "pick_up_place":pick_up_place,
            "seller_id":UserDefaults.standard.integer(forKey: "uid")
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        let task=URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Merch.self, from: data)
                    completion(.success(response))
                }
                catch(let error){
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    //GET get all merch
    func getAllMerch(completion: @escaping (Result<[Merch], Error>) -> Void) {
        var request=URLRequest(url: merchURL)
        request.httpMethod="GET"

        let task=URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(MerchResponse.self, from: data)
                    completion(.success(response.merch))
                }
                catch(let error){
                    print(String(describing: error))
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    //GET merch by merch_id
    func getOneMerch(merch_id:Int,completion: @escaping (Merch) -> Void) {
        var request=URLRequest(url: merchURL)
        request.httpMethod="GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.setValue(String(merch_id), forHTTPHeaderField: "merch_id")
        
        let task=URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Merch.self, from: data)
                    completion(response)
                }
                catch(let error){
                    print(String(describing: error))
                }
            }
        }
        task.resume()
    }
    
    //GET merch by seller_id
    func getSellerMerch(completion: @escaping ([Merch]) -> Void) {
        var request=URLRequest(url: merchURL)
        request.httpMethod="GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.setValue(String(UserDefaults.standard.integer(forKey: "uid")), forHTTPHeaderField: "seller_id")
        
        let task=URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(MerchResponse.self, from: data)
                    completion(response.merch) 
                }
                catch(let error){
                    print(String(describing: error))
                }
            }
        }
        task.resume()
    }
    
    //POST create order
    func createOrder(merch_id:Int, num:Int, notes: String, completion: @escaping (Result<Order, Error>) -> Void) {
        var request=URLRequest(url: orderURL)
        request.httpMethod="POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        let body:[String:Any] = [
            "merch_id":merch_id,
            "buyer_id":UserDefaults.standard.integer(forKey: "uid"),
            "buyer_notes":notes,
            "item_amount":num
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        let task=URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Order.self, from: data)
                    completion(.success(response))
                }
                catch(let error){
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    //GET orders by merch_id
    func getOrderByMid(merch_id:Int,completion: @escaping ([Order]) -> Void) {
        var request=URLRequest(url: orderURL)
        request.httpMethod="GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.setValue(String(merch_id), forHTTPHeaderField: "merch_id")
        
        let task=URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(OrderResponse.self, from: data)
                    completion(response.order)
                }
                catch(let error){
                    print(String(describing: error))
                }
            }
        }
        task.resume()
    }
    
    //GET orders by buyer_id
    func getOrderByBid(completion: @escaping ([Order]) -> Void) {
        var request=URLRequest(url: orderURL)
        request.httpMethod="GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.setValue(String(UserDefaults.standard.integer(forKey: "uid")), forHTTPHeaderField: "buyer_id")
        
        let task=URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(OrderResponse.self, from: data)
                    completion(response.order)
                }
                catch(let error){
                    print(String(describing: error))
                }
            }
        }
        task.resume()
    }
    
    //POST modify order by order_id
    func updateMerch(order_id:Int, picked_up: Bool, paid: Bool, completion: @escaping (Order) -> Void) {
        let url = URL(string: "http://127.0.0.1:8000/orders/"+String(order_id))!
        var request=URLRequest(url: url)
        request.httpMethod="POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        let body:[String:Any] = [
            "payment_received":paid,
            "picked_up":picked_up
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        let task=URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Order.self, from: data)
                    completion(response)
                }
                catch(let error){
                    print(String(describing: error))
                }
            }
        }
        task.resume()
    }
}


