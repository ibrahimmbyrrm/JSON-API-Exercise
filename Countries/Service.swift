//
//  Service.swift
//  Countries
//
//  Created by İbrahim Bayram on 9.02.2023.
//

import Foundation

struct Webservice {
   
    
    func getData(url : URL, completion : @escaping ([Country]?) -> ()) {
        
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }else if let safeData = data {
                    do {
                        let output = try? JSONDecoder().decode([Country].self, from: safeData)
                        completion(output)
                    }
                }
                
                
            }.resume()
        }
        
    }

struct requestURLs {
    let urlForAll = URL(string: "http://api.countrylayer.com/v2/all?access_key=2a2c43751c1d0d3d67b1cab57cfe3cad")
    let asiaURL = URL(string: "http://api.countrylayer.com/v2/region/asia?access_key=2a2c43751c1d0d3d67b1cab57cfe3cad")
    let europeURL = URL(string: "http://api.countrylayer.com/v2/region/europe?access_key=2a2c43751c1d0d3d67b1cab57cfe3cad")
    let africaURL = URL(string: "http://api.countrylayer.com/v2/region/africa?access_key=2a2c43751c1d0d3d67b1cab57cfe3cad")
    let americaURL = URL(string: "http://api.countrylayer.com/v2/region/americas?access_key=2a2c43751c1d0d3d67b1cab57cfe3cad")
}
