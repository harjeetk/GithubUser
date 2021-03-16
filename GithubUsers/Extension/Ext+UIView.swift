import UIKit

extension UIView {
    
    func getEmptyView(title: String, message: String, font: UIFont) -> UIView {
        let emptyView = UIView(
            frame: CGRect(
                x: self.center.x,
                y: self.center.y,
                width: self.bounds.size.width,
                height: self.bounds.size.height
            )
        )
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = font
        
        messageLabel.textColor = UIColor.black
        messageLabel.font = UIFont.systemFont(ofSize: 15)
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        titleLabel.text = title
        messageLabel.text = message
        
        return emptyView
    }
    
    func circularView(borderWidth: CGFloat = 0, backColor: UIColor = .clear) {
        DispatchQueue.main.async {
            self.clipsToBounds = true
            self.layer.cornerRadius = self.frame.width / 2
            
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = backColor.cgColor
        }
    }
    
    func showBorder(_ color: UIColor, _ cornerRadius: CGFloat, _ borderWidth: CGFloat = 1) {
        DispatchQueue.main.async {
            self.clipsToBounds = true
            self.layer.borderColor = color.cgColor
            self.layer.cornerRadius = cornerRadius
            self.layer.borderWidth = borderWidth
        }
    }
}
