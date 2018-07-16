import Alamofire
import Foundation

class BasketService: GBShopSessionManager {

}

extension BasketService: BasketRequestsFactory {
    func addToBasket(idProduct: Int,
                     quantity: Int,
                     completionHandler: @escaping (DataResponse<AddToBasketResult>) -> Void) {
        let requestModel = AddToBasketRouter(baseURL: baseUrl, idPorduct: idProduct, quantity: quantity)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func deleteFromBasket(idProduct: Int,
                          completionHandler: @escaping (DataResponse<RemoveFromBasketResult>) -> Void) {
        let requestModel = DeleteFromBasketRouter(baseURL: baseUrl, idPorduct: idProduct)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func getBasket(idUser: Int,
                   completionHandler: @escaping (DataResponse<GetBasketResult>) -> Void) {
        let requestModel = GetBasketRouter(baseURL: baseUrl, idUser: idUser)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}
