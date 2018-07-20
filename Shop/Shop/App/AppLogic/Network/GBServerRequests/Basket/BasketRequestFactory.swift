import Alamofire
import Foundation

/// abstract service class
protocol BasketRequestsFactory {
    
    func add(idProduct: Int,
             quantity: Int,
             completionHandler: @escaping RequestVoidCompletion<AddToBasketResult>)
    
    func delete(idProduct: Int,
                completionHandler: @escaping RequestVoidCompletion<RemoveFromBasketResult>)
    
    func getContents(idUser: Int,
                     completionHandler: @escaping RequestVoidCompletion<GetContentsResult>)
}
