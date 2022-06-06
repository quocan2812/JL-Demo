//
//  apiWorker.swift
//  JLDemo
//
//  Created by VN01-MAC-0005 on 04/06/2022.
//

import Foundation

protocol ApiWorkerProtocol {
    
    func getDataFromApiToCall(onSuccess: @escaping ([ItemToCall]) -> Void, onFail: @escaping (Error?) -> Void)
    
    func getDataFromApiToBuy(onSuccess: @escaping ([ItemToBuy]) -> Void, onFail: @escaping (Error?) -> Void)
}

final class ApiWorker: ApiWorkerProtocol {
    
    func getDataFromApiToCall(onSuccess: @escaping ([ItemToCall]) -> Void, onFail: @escaping (Error?) -> Void) {
        let urlString = "https://my-json-server.typicode.com/imkhan334/demo-1/call"
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil else {
                    print (error!.localizedDescription)
                    print ("stuck in data task")
                    onFail(error)
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let itemCalls = try decoder.decode([ItemToCall].self, from: data!)
                    onSuccess(itemCalls)
                }
                catch {
                    print ("an error in catch")
                    print (error)
                }
                
            }.resume()
        }
        
    }
    
    func getDataFromApiToBuy(onSuccess: @escaping ([ItemToBuy]) -> Void, onFail: @escaping (Error?) -> Void) {
        let urlString = "https://my-json-server.typicode.com/imkhan334/demo-1/buy"
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil else {
                    print (error!.localizedDescription)
                    print ("stuck in data task")
                    onFail(error)
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let itemBuys = try decoder.decode([ItemToBuy].self, from: data!)
                    onSuccess(itemBuys)
                }
                catch {
                    print ("an error in catch")
                    print (error)
                }
                
            }.resume()
        }
        
    }
    
}
