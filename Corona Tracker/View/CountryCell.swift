import UIKit

class CountryCell: UITableViewCell {
    
    let countryLabel : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .monospacedSystemFont(ofSize: 15, weight: .medium)
        return view
    }()
    
    let viewIcon : UIImageView = {
        let view = UIImageView()
        view.image = nil
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(countryLabel)
        addSubview(viewIcon)
        
        
        // Country Label Constraint
        NSLayoutConstraint.activate([
            countryLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 10),
            //countryLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            countryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            viewIcon.centerYAnchor.constraint(equalTo: countryLabel.centerYAnchor),
            viewIcon.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -10),
            viewIcon.heightAnchor.constraint(equalToConstant: 30),
            viewIcon.widthAnchor.constraint(equalToConstant: 30)
        ])
    }


}
