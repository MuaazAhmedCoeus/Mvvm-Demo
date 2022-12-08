//
//  Service.swift
//  DemoMVVM
//
//  Created by Muaaz on 06/12/2022.
//
import Foundation
import UIKit

class Service: NSObject {

    static let sharedInstance = Service()
    
    func serverCall(urlString: String, param : [String:String] = [:], completion: @escaping ((Data) -> Void)) {
        guard let  url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                
                print("Loading data error: \(err.localizedDescription)")
            } else {
                guard let data = data else { return }
                print(data)
                completion(data)
            }
        }.resume()
    }
    
    func decodeData<T: Decodable>(from data: Data) -> T? {
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch {
            print(error as Any)
            return nil
        }
    }
}
