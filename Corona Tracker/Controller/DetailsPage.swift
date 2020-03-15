
import UIKit

final class DetailsPage: UIViewController {
    
    let myTableView : UITableView = {
       let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        return view
    }()
    
    var countryName : String?
    let backgroundColorList = [UIColor.black,UIColor.red,#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)]
    var countList : [Int] = [Int]()
    let efectName = ["CONFİRMED","DEATHS","RECOVERED"]

    override func viewDidLoad() {
        super.viewDidLoad()
        showWaitOverlay()
        
        view.backgroundColor = .white
        title = "Details"
        myTableView.rowHeight = view.bounds.size.height * 0.2
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(DetailsPageCell.self, forCellReuseIdentifier: "detailsPageCell")
        fetchData(name: countryName!)

        setupView()

    }
    
    fileprivate func setupView(){
        view.addSubview(myTableView)
        NSLayoutConstraint.activate([
            myTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            myTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
        ])
        
    }

}

extension DetailsPage : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsPageCell") as! DetailsPageCell
        cell.countText.text = String(countList[indexPath.row])
        cell.card.backgroundColor = backgroundColorList[indexPath.row]
        cell.visualEfectText.text = efectName[indexPath.row]
        return cell
    }
    
}

extension DetailsPage {
    
    private func fetchData(name:String){
        CoronaTrackerService.getDetails(countryName: name, completionHandler: { json in
            self.countList = [json.confirmed.value,json.deaths.value,json.recovered.value]
            self.myTableView.reloadData()
        })
    }
}
