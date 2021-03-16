import UIKit

class CustomActivityIndicator: UIVisualEffectView {
    
    var vSpinner: UIActivityIndicatorView?
    
    func show(onView: UIView, point: CGPoint? = nil) {
        if self.vSpinner != nil {
            self.hide()
        }
        
        DispatchQueue.main.async {
            self.viewWithTag(101)?.removeFromSuperview()
            
            self.vSpinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
            self.vSpinner?.tag = 101
            
            onView.addSubview(self.vSpinner!)
            
            self.vSpinner?.startAnimating()
            
            if let point = point {
                self.vSpinner?.center = point
            } else {
                self.vSpinner?.center = onView.center
            }
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            self.vSpinner?.stopAnimating()
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
}

