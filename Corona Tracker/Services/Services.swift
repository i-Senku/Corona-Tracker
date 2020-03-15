import Alamofire

struct CoronaTrackerService {
    
    static func getData(completionHandler : @escaping (CoronaTracker)->() ){
        let URL = "https://covid.mathdro.id/api"
        
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
        
        let URL = "https://covid19.mathdro.id/api/countries/\(countryName)"
        
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
}
