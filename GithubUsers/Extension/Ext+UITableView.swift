import UIKit

extension UITableView {
    
    func register(_ cellClass: String) {
        register(UINib(nibName: cellClass, bundle: nil), forCellReuseIdentifier: cellClass)
    }
    
    func setRows(_ array: [Any], noDataTitle title: String, message: String, font: UIFont = UIFont.systemFont(ofSize: 19, weight: .medium)) -> Int {
        let totalCount = array.count
        
        if totalCount == 0 {
            setEmptyView(title: title, message: message, font: font)
        } else {
            restore()
        }
        
        return array.count
    }
    
    private func setEmptyView(title: String, message: String, font: UIFont) {
        self.backgroundView = self.getEmptyView(title: title, message: message, font: font)
    }
    
    public func restore() {
        self.backgroundView = nil
    }
    
    func setHeaderFooterView(headHeight: CGFloat, footHeight: CGFloat) {
        var view = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: headHeight))
        tableHeaderView = view
        
        view = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: footHeight))
        tableFooterView = view
    }
}
