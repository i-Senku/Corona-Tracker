import UIKit
import SwiftOverlays

final class StatisticsPage: UIViewController {
    
    let myTableView : UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headerCard : UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let searchBar : UISearchBar = {
       let view = UISearchBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Search Country"
        return view
    }()
    
    // *---------------------------------TEXTS---------------------------------------- * //
    
    let confirmedText : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Waiting"
        view.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.font = .boldSystemFont(ofSize: 20)
        return view
    }()
    
    
    let deathsText : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Waiting"
        view.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        view.font = .boldSystemFont(ofSize: 20)
        return view
    }()
    
    let recoveredText : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Waiting"
        view.textColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
        view.font = .boldSystemFont(ofSize: 20)
        return view
    }()
    
    let latestUpdated : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Last Update : "
        view.font = .monospacedSystemFont(ofSize: 13, weight: .medium)
        return view
    }()
    
    
    // *---------------------------------DETAILS--------------------------------------- * //

    let confirmedDetail : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Confirmed"
        view.font = .monospacedSystemFont(ofSize: 13, weight: .medium)
        return view
    }()
    
    let deathsDetail : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Deaths"
        view.font = .monospacedSystemFont(ofSize: 13, weight: .medium)
        return view
    }()
    
    let recoveredDetail : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Recovered"
        view.font = .monospacedSystemFont(ofSize: 13, weight: .medium)
        return view
    }()
    
    // *----------------------------------END----------------------------------------- * //
    
    var countryList : [String] = [String]()
    var searchCountryList : [String] = [String]()
    var isSearch : Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Statistics"
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .always
        myTableView.delegate = self
        myTableView.dataSource = self
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        

        myTableView.register(CountryCell.self, forCellReuseIdentifier: "countryPage")

        setupView()
        fetchData()
    
    }
}


extension StatisticsPage {
    
    fileprivate func setupView(){
        view.addSubview(headerCard)
        view.addSubview(latestUpdated)
        view.addSubview(myTableView)
        view.addSubview(searchBar)
        
        // Header Card Constraint
        NSLayoutConstraint.activate([
            headerCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            headerCard.widthAnchor.constraint(equalTo: view.widthAnchor),
            headerCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        // Stack View Constraint
        setupStackText()
        
        // Latest Text Constraint
        NSLayoutConstraint.activate([
            latestUpdated.bottomAnchor.constraint(equalTo: headerCard.bottomAnchor,constant: -15),
            latestUpdated.trailingAnchor.constraint(equalTo: headerCard.trailingAnchor,constant: -10),
        ])
        
        // TableView Constraint
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor,constant: 10),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // SearchBar Constraint
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: headerCard.bottomAnchor,constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
    fileprivate func setupStackText(){
        let stack = UIStackView(arrangedSubviews: [confirmedText,deathsText,recoveredText])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalCentering
        
        let stackDetail = UIStackView(arrangedSubviews: [confirmedDetail,deathsDetail,recoveredDetail])
        stackDetail.translatesAutoresizingMaskIntoConstraints = false
        stackDetail.distribution = .equalCentering
        
        view.addSubview(stack)
        view.addSubview(stackDetail)
        
        NSLayoutConstraint.activate([
            //stack.heightAnchor.constraint(equalToConstant: 50),
            stack.bottomAnchor.constraint(equalTo: headerCard.bottomAnchor,constant: -60),
            stack.leadingAnchor.constraint(equalTo: headerCard.leadingAnchor,constant: 10),
            stack.trailingAnchor.constraint(equalTo: headerCard.trailingAnchor,constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            stackDetail.bottomAnchor.constraint(equalTo: stack.topAnchor,constant: -10),
            stackDetail.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            stackDetail.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
        ])
        
    }
}

extension StatisticsPage : UITableViewDelegate,UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearch ? searchCountryList.count : countryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryPage") as! CountryCell
        cell.countryLabel.text = isSearch ? searchCountryList[indexPath.row] : countryList[indexPath.row]
        cell.viewIcon.image = UIImage(systemName: "arrowtriangle.right.fill")
        cell.viewIcon.tintColor = .darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsPage()
        if isSearch {
            vc.countryName = searchCountryList[indexPath.row]
        }else{
            vc.countryName = countryList[indexPath.row]
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension StatisticsPage : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            isSearch = false
        }else{
            isSearch = true
            searchCountryList = countryList.filter { (text) -> Bool in
                return text.lowercased().contains(searchText.lowercased())
            }
        }
        myTableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearch = false
        searchBar.text = ""
        view.endEditing(true)
        myTableView.reloadData()
    }
}

extension StatisticsPage {
    
    fileprivate func fetchData(){
        showWaitOverlay()
        CoronaTrackerService.getData { (jsonData) in
            let last = jsonData.lastUpdate
            
            self.confirmedText.text = String(jsonData.confirmed.value)
            self.deathsText.text = String(jsonData.deaths.value)
            self.recoveredText.text = String(jsonData.recovered.value)
            self.latestUpdated.text = "Last Update : \(last)"
            
            for (key,_) in Countries.countries {
                self.countryList.append(key)
            }
            self.countryList = self.countryList.sorted()
            self.myTableView.reloadData()
            
            
            self.removeAllOverlays()
        }
    }
    
}
