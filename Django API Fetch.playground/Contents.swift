import UIKit
import Alamofire
import SwiftyJSON

// MARK: - Data retrieval for all snippets from Django API setup

func getAllSnippets(url: String) {
    
    AF.request(url, encoding: JSONEncoding.default).responseJSON { response in

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
}

// MARK: - Data creation for a new snippet

func createSnippet(url: String, headers: HTTPHeaders, parameters: [String:String]) {
    
    AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
        
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
}

// MARK: - Data retrieval for a specific snippet

func retrieveSnippet(url: String, headers: HTTPHeaders) {
    
    AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in

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
}

// MARK: - Data update for a specific snippet

func updateSnippet(url: String, headers: HTTPHeaders, parameters: [String:String]) {
    
    AF.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in

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
}

// MARK: - Data deletion for a specific snippet

func deleteSnippet(url: String, headers: HTTPHeaders) {
    
    AF.request(url, method: .delete, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in

        switch response.result {
        case .success:
            print("Validation successful!")
            print("Data has been deleted")

        case let .failure(error):
            print("Error accessing network: \(error)")
        }
    }
}

// MARK: - Variables for passing to CRUD functions

// URL to create snippet / get all snippets
let getSnippetsURL = "http://127.0.0.1:8000/snippets/"

// URL to get first snippet
let firstSnippetURL = "http://127.0.0.1:8000/snippets/1/"

var httpHeaders: HTTPHeaders

httpHeaders = [
    .accept("application/json")
]

// Parameters to update first snippet
let code: String = "print('I am a print statement.')"
let title: String = "Generic print statement in Python"

let passedParameters = [
    "code": code,
    "title": title
]

// URL to delete a specific snippet
let deleteSnippetURL = "http://127.0.0.1:8000/snippets/7/"

// Parameters to create a snippet
let newCode: String = "var five = 5"
let newTitle: String = "Assign Mutable Variable in Swift"
let newLanguage: String = "swift"

let createParameters = [
    "code": newCode,
    "title": newTitle,
    "language": newLanguage
]

// MARK: - Calling of CRUD functions

//getAllSnippets(url: getSnippetsURL)
//createSnippet(url: getSnippetsURL, headers: httpHeaders, parameters: createParameters)
//retrieveSnippet(url: firstSnippetURL, headers: httpHeaders)
//updateSnippet(url: firstSnippetURL, headers: httpHeaders, parameters: passedParameters)
//deleteSnippet(url: deleteSnippetURL, headers: httpHeaders)
