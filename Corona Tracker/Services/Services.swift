import Alamofire

struct CoronaTrackerService {
    
    static func getData(completionHandler : @escaping (CoronaTracker)->() ){
        let URL = "https://corona.lmao.ninja/all"
        
        AF.request(URL).response { response in
            guard let data = response.data else {return}
            do{
                let jsonDecode = try JSONDecoder().decode(CoronaTracker.self, from: data)
                completionHandler(jsonDecode)
                
            }catch{
                print("Hata")
            }
        }
    }
    
    static func getDetails(countryName : String ,completionHandler : @escaping (CountryDetails)->()){
        
        let URL = "https://corona.lmao.ninja/countries/\(countryName.lowercased())"
        
        AF.request(URL).response { (response) in
            guard let data = response.data else {return}
            
            do{
                let jsonDecode = try JSONDecoder().decode(CountryDetails.self, from: data)
                completionHandler(jsonDecode)
            }catch{
                print("Hata")
            }
        }
        
    }
    
    static func getCountry(completionHandler : @escaping ([Countries])->() ){
        let URL = "https://corona.lmao.ninja/countries"
        AF.request(URL).response(completionHandler: {response in
            guard let data = response.data else {return}
            
            do{
                let jsonDecode = try JSONDecoder().decode([Countries].self, from: data)
                completionHandler(jsonDecode)
            }catch{
                print("Hata")
            }
            
        })
    }
    
    static func getTimeLine(completionHandler : @escaping ([TimeLine])->() ){
        let URL = "https://api.the2019ncov.com/api/timeline"
        AF.request(URL).response { (response) in
            guard let data = response.data else {return}
            
            do{
                let jsonDecode = try JSONDecoder().decode([TimeLine].self, from: data)
                
                completionHandler(jsonDecode)
            }catch{
                print(error.localizedDescription)
            }
            
        }
    }
    
    static func getNews(completionHandler : @escaping (News)->() ){
        let URL = "https://lab.isaaclin.cn/nCoV/api/news"
        
        AF.request(URL).response { (response) in
            guard let data = response.data else { return }
            
            do{
                let jsonDecode = try JSONDecoder().decode(News.self, from: data)
                
                completionHandler(jsonDecode)
            }catch{
                print(error.localizedDescription)
            }
            
        }
    }
}
