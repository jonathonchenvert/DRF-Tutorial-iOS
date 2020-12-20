import UIKit
import Alamofire
import SwiftyJSON

// MARK: - Data retrieval for all snippets from Django API setup

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

// MARK: - Data retrieval for a specific snippet

let firstSnippetURL = "http://127.0.0.1:8000/snippets/1/"

var headers: HTTPHeaders

headers = [
    .accept("application/json")
]

AF.request(firstSnippetURL, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in

    switch response.result {
    case .success:
        print("Validation successful!")

        let dataJSON: JSON = JSON(response.value!)
        //print("Data: \(dataJSON)")

        guard let title = dataJSON["title"].string else { return }
        guard let code = dataJSON["code"].string else { return }
        guard let linenos = dataJSON["linenos"].bool else { return }
        guard let language = dataJSON["language"].string else { return }
        guard let style = dataJSON["style"].string else { return }

        print("Title: \(title)\nLanguage: \(language)\nCode: \(code)Linenos? \(linenos)\nStyle: \(style)\n")

    case let .failure(error):
        print("Error accessing network: \(error)")
    }
}

// MARK: - Data update for a specific snippet

let code: String = "print('Hello, world!')"
let title: String = "Hello World in Python"

let parameters = [
    "code": code,
    "title": title
]

AF.request(firstSnippetURL, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in

    switch response.result {
    case .success:
        print("Validation successful!")

        let dataJSON: JSON = JSON(response.value!)
        //print("Data: \(dataJSON)")

        guard let title = dataJSON["title"].string else { return }
        guard let code = dataJSON["code"].string else { return }
        guard let linenos = dataJSON["linenos"].bool else { return }
        guard let language = dataJSON["language"].string else { return }
        guard let style = dataJSON["style"].string else { return }

        print("Title: \(title)\nLanguage: \(language)\nCode: \(code)Linenos? \(linenos)\nStyle: \(style)\n")

    case let .failure(error):
        print("Error accessing network: \(error)")
    }
}

// MARK: - Data deletion for a specific snippet

let fourthSnippetURL = "http://127.0.0.1:8000/snippets/4/"

AF.request(fourthSnippetURL, method: .delete, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in

    switch response.result {
    case .success:
        print("Validation successful!")
        print("Data has been deleted")

    case let .failure(error):
        print("Error accessing network: \(error)")
    }
}

// MARK: - Data creation for a new snippet

let newCode: String = "int myNum = 15;"
let newTitle: String = "Assign Variable in Java"
let newLanguage: String = "java"

let newParameters = [
    "code": newCode,
    "title": newTitle,
    "language": newLanguage
]

AF.request(getSnippetsURL, method: .post, parameters: newParameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
    
    switch response.result {
    case .success:
        print("Validation successful!")

        let dataJSON: JSON = JSON(response.value!)
        //print("Data: \(dataJSON)")

        guard let title = dataJSON["title"].string else { return }
        guard let code = dataJSON["code"].string else { return }
        guard let linenos = dataJSON["linenos"].bool else { return }
        guard let language = dataJSON["language"].string else { return }
        guard let style = dataJSON["style"].string else { return }

        print("Title: \(title)\nLanguage: \(language)\nCode: \(code)Linenos? \(linenos)\nStyle: \(style)\n")

    case let .failure(error):
        print("Error accessing network: \(error)")
    }

}
