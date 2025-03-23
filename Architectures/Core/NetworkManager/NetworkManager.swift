import Foundation
import Alamofire

final class NetworkManager  {

    public typealias DataCompletion = (Result<Data, AFError>) -> Void

    public func dataRequest(_ request: WebRequest, then completion:  DataCompletion?) {
        AF.request(request.url, method: request.method, parameters: request.parameters).validate().responseData { response in
            completion?(response.result)
        }
    }
}
