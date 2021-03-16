import UIKit
import SDWebImage

extension UIImageView {
    
    func setWebImage(
        url: String?,
        placeholder: UIImage?,
        complete: @escaping (_ image: UIImage?) -> Void) {
        
        //print(url.asString())
        
        if let url = url,
           !url.isEmpty,
           let newurl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let imgUrl = URL(string: newurl) {
            
            self.sd_setShowActivityIndicatorView(true)
            self.sd_setIndicatorStyle(UIActivityIndicatorView.Style.medium)
            
            self.sd_setImage(
                with: imgUrl,
                placeholderImage: placeholder,
                options: [.refreshCached],
                completed: { downImage, error, cacheType, imageURL in
                    let isDone = downImage != nil
                    let image = isDone ? downImage : placeholder
                    self.image = image
                    complete(image)
                })
        } else {
            self.image = placeholder
            complete(placeholder)
        }
    }
    
}


