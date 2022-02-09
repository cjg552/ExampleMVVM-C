//
//  NetworkClient.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 18/1/22.
//

import Foundation

typealias CompletionHandler = (_ anObject: Any?,_ error: Error?) -> Void

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case delete = "DELETE"
    case put = "PUT"
}

class NetworkClient {
    private var defaultSession: URLSession!
    private var dataTask: URLSessionDataTask!
    private var urlService: URL!
    private var urlRequest: URLRequest!
    private var requestDataParams: Data?
    private var httpMethod: HTTPMethod!
    var blockCallBack: CompletionHandler!
    
    init(urlService: URL, requestData: Data?, httpMethod: HTTPMethod) {
        self.requestDataParams = requestData
        self.urlService = urlService
        self.httpMethod = httpMethod
        
        let defaultConfigObject = URLSessionConfiguration.default
        self.defaultSession = URLSession(configuration: defaultConfigObject, delegate: nil, delegateQueue: OperationQueue.main)
        self.urlRequest = URLRequest(url: self.urlService)
        self.urlRequest.httpMethod = self.httpMethod.rawValue
        self.urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        self.urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        self.urlRequest.httpBody = self.requestDataParams
    }
    
    func sendRequest(completionBlock: @escaping CompletionHandler) {
        self.blockCallBack = completionBlock
        print("SEND URL REQUEST: " + self.urlRequest.url!.absoluteString)
        self.dataTask = self.defaultSession.dataTask(with: self.urlRequest, completionHandler: { (data, response, error) -> Void in
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: (\(httpResponse.statusCode))")
                let text = String(data: data!, encoding: .isoLatin1)
                NSLog("Response = %@", text!)
                let code = httpResponse.statusCode
                if code == 200 {
                    if let data = data, let _ = response, error == nil {
                        self.processResponseData(data)
                    }
                }
                else {
                    
                }
            }
        })
        
        self.dataTask.resume()
    }
    
    func processResponseData(_ data: Data?) {
        fatalError("You need to override this method in the child object")
    }
    
    func processError(_ error: Error) {
        
    }
    
}
