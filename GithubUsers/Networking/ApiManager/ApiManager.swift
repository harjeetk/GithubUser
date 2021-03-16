import Foundation

public typealias ApiParam = [String: Any]

class APIManager {
    
    func call<T>(
        api urlString: String,
        handler: @escaping (Swift.Result<T, AlertMessage>) -> Void) where T: Codable {
        
        if !Reachability.isConnectedToNetwork() {
            return
        }
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            // Check if an error occurs
            DispatchQueue.main.async {
                if let data = data, let items = self.parseData(data: data) as T? {
                    return handler(.success(items))
                    
                } else if let error = error as? AlertMessage {
                    print(error.localizedDescription)
                    return handler(.failure(error))
                }
                let errorAlertMessage = self.parseApiError(data: data)
                print(errorAlertMessage.body, errorAlertMessage.localizedDescription)
                return handler(.failure(errorAlertMessage))
            }
        })
        task.resume()
    }
    
    func parseData<T: Codable>(data: Data) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    private func parseApiError(data: Data?) -> AlertMessage {
        if let jsonData = data, let error = try? JSONDecoder().decode(NetworkError.self, from: jsonData) {
            return AlertMessage(title: "Error", body: error.key ?? error.message)
        }
        return AlertMessage(title: "Error", body: "Please try again later.")
    }
}
