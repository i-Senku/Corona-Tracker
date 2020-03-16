
import UIKit

final class DetailsPage: UIViewController {
    
    let myTableView : UITableView = {
       let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        return view
    }()
    
    var countryName : String?
    let backgroundColorList = [UIColor.black,#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)]
    var countList : [Int] = [Int]()
    let efectName = ["CASES","DEATHS","RECOVERED"]

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
        cell.selectionStyle = .none
        return cell
    }
    
}

extension DetailsPage {
    
    private func fetchData(name:String){
        CoronaTrackerService.getDetails(countryName: name, completionHandler: { json in
            self.countList = [json.cases,json.deaths,json.recovered]
            self.myTableView.reloadData()
        })
    }
}
