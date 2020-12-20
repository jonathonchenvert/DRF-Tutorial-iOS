import UIKit
import Alamofire
import SwiftyJSON

// MARK: - Data retrieval from Django API setup
let getSnippetsURL = "http://127.0.0.1:8000/snippets/"

AF.request(getSnippetsURL, encoding: JSONEncoding.default).responseJSON { response in

    switch response.result {
    case .success:
        print("Validation successful!")
        let dataJSON: JSON = JSON(response.value!)
        //print("Data: \(dataJSON)")
        //print("Count: \(dataJSON.count)")

        for data in 0...dataJSON.count {
            guard let title = dataJSON[data]["title"].string else { return }
            guard let code = dataJSON[data]["code"].string else { return }
            guard let linenos = dataJSON[data]["linenos"].bool else { return }
            guard let language = dataJSON[data]["language"].string else { return }
            guard let style = dataJSON[data]["style"].string else { return }

            print("Title: \(title)\nLanguage: \(language)\nCode: \(code)Linenos? \(linenos)\nStyle: \(style)\n")
        }

    case let .failure(error):
        print("Error accessing network: \(error)")
    }
}
