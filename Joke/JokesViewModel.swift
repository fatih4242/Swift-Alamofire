//
//  JokeViewModel.swift
//  Joke
//
//  Created by Fatih Toker on 11.10.2022.
//

import Foundation
import Alamofire

//https://raw.githubusercontent.com/atilsamancioglu/JokesAppJsonData/main/chuck.json

//gelen verilen şeyler view yayın yapma'ya yarıyor observable
class JokesViewModel : ObservableObject{


    @Published var jokes = [Value]()//published diğer tarafda gözlemleyebilmek için
    

    
    init(){
        
        getJokes()
    }
    
    func getJokes(){
        
        AF.request("https://raw.githubusercontent.com/atilsamancioglu/JokesAppJsonData/main/chuck.json", method:.get).responseDecodable( of: Welcome.self){response in
           
            switch response.result{
            case .success(let data):
               
                let value = data.value
                self.jokes += value
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
}
