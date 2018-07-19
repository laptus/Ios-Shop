import Alamofire
import Foundation

class BasketService: GBShopSessionManager {
    
}

/// gb shop basket service
extension BasketService: BasketRequestsFactory {
    
    func add(idProduct: Int,
             quantity: Int,
             completionHandler: @escaping RequestVoidCompletion<AddToBasketResult>) {
        
        let requestModel = AddToBasketRouter(baseURL: baseUrl, idPorduct: idProduct, quantity: quantity)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func delete(idProduct: Int,
                completionHandler: @escaping RequestVoidCompletion<RemoveFromBasketResult>) {
        
        let requestModel = DeleteFromBasketRouter(baseURL: baseUrl, idPorduct: idProduct)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func getContents(idUser: Int,
                     completionHandler: @escaping RequestVoidCompletion<GetContentsResult>) {
        
        let requestModel = GetBasketRouter(baseURL: baseUrl, idUser: idUser)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}
