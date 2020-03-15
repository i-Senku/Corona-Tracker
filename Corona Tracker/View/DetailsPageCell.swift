import UIKit
import SwiftOverlays

final class DetailsPageCell: UITableViewCell {
    
    let card : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
        
    let countText : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .boldSystemFont(ofSize: 24)
        view.textColor = .white
        view.textAlignment = .center
        return view
    }()
    
    let visualEfect : UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let visualEfectText : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .boldSystemFont(ofSize: 18)
        view.textColor = .white
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView(){
        addSubview(card)
        addSubview(countText)
        addSubview(visualEfect)
        addSubview(visualEfectText)
        
        NSLayoutConstraint.activate([
            card.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5),
            card.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5),
            card.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5),
            card.topAnchor.constraint(equalTo: topAnchor,constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            countText.bottomAnchor.constraint(equalTo: visualEfect.topAnchor,constant: -25),
            countText.leadingAnchor.constraint(equalTo: card.leadingAnchor),
            countText.trailingAnchor.constraint(equalTo: card.trailingAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            visualEfect.bottomAnchor.constraint(equalTo: card.bottomAnchor),
            visualEfect.leadingAnchor.constraint(equalTo: card.leadingAnchor),
            visualEfect.trailingAnchor.constraint(equalTo: card.trailingAnchor),
            visualEfect.heightAnchor.constraint(equalTo: card.heightAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.activate([
            visualEfectText.centerYAnchor.constraint(equalTo: visualEfect.centerYAnchor),
            visualEfectText.centerXAnchor.constraint(equalTo: visualEfect.centerXAnchor)
        ])
    }
    
}
