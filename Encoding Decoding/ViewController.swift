//
//  ViewController.swift
//  Encoding Decoding
//
//  Created by Sharetrip-iOS on 17/08/2021.
//

import UIKit

struct Person : Codable{
    
    var name : String
    var age : Int
    var address : String
    
    
}



class ViewController: UIViewController {

    var person = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        person.append(Person(name: "Manna", age: 27, address: "Rangpur"))
        person.append(Person(name: "Munna", age: 24, address: "Dhaka"))
        person.append(Person(name: "Manna", age: 27, address: "Rangpur"))
        person.append(Person(name: "Munna", age: 24, address: "Dhaka"))
                     
      jsonEncoder()
        jsonDecoder()
    }

    func jsonEncoder(){
    
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try encoder.encode(person)
            
               let strData = String(data: data, encoding: .utf8)
            
            guard let str = strData else {
                return
            }
            print(str)
            

            
        } catch let err {
            
            print(err.localizedDescription)
        }
       
        

        
        
    }
    
    
    
    func jsonDecoder(){
        
        
        
        let jsonData = """
[
   {
      "name":"Manna",
      "age":29,
      "address":"Rangpur"
   },
   {
      "name":"Munna",
      "age":29,
      "address":"Rangpur"
   },
   {
      "name":"Shaon",
      "age":29,
      "address":"Rangpur"
   },
   {
      "name":"Limon",
      "age":29,
      "address":"Rangpur"
   }
]
""".data(using: .utf8)
        
        
        let decoder = JSONDecoder()
        do {
            
            guard let data = jsonData else {
                return
            }
            let strData = try decoder.decode([Person].self, from: data)
           
            for x in strData{
                print(x.age,x.age,x.address)
                
            }
            
            
        } catch let err {
            print(err.localizedDescription)
        }
        
        
        
        
        
    }
    
    
    

}

