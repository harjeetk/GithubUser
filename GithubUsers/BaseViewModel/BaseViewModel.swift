import Foundation

class BaseViewModel: NSObject {
    
    var alertMessage: Dynamic<AlertMessage> = Dynamic(AlertMessage(title: "", body: ""))
    var isLoaderHidden: Dynamic<Bool> = Dynamic(true)
    
    // MARK: - Vars & Lets
    let apiManager = APIManager()
    
    override init() {
        super.init()
    }
    
    
}
