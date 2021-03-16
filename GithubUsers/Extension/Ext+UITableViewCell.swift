import UIKit

extension UITableViewCell {
    
    static var defaultCell: UITableViewCell {
        let cell = UITableViewCell()
        cell.clearCell()
        return cell
    }
    
    static var identifier: String {
        return (self.description().split(separator: ".").last?.description) ?? ""
    }
    
    func clearCell() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        imageView?.image = nil
        textLabel?.text = nil
        
        selectionStyle = .none
    }
}
