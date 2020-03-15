
import UIKit

class TimeLineCell: UITableViewCell {
    
    let dateText : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
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
        addSubview(dateText)
        addSubview(viewIcon)
        
        
        // Country Label Constraint
        NSLayoutConstraint.activate([
            dateText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 10),
            dateText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            dateText.centerYAnchor.constraint(equalTo: centerYAnchor),
            dateText.topAnchor.constraint(equalTo: topAnchor,constant: 5)
            
        ])
        
        NSLayoutConstraint.activate([
            viewIcon.centerYAnchor.constraint(equalTo: dateText.centerYAnchor),
            viewIcon.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -10),
            viewIcon.heightAnchor.constraint(equalToConstant: 30),
            viewIcon.widthAnchor.constraint(equalToConstant: 30)
        ])
    }

    
    
}
