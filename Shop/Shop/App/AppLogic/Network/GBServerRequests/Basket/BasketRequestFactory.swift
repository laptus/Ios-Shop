import Alamofire
import Foundation

protocol BasketRequestsFactory {
   
    func addToBasket(idProduct: Int,
                     quantity: Int,
                     completionHandler: @escaping (DataResponse<AddToBasketResult>) -> Void)
    
    func deleteFromBasket(idProduct: Int,
                          completionHandler: @escaping (DataResponse<RemoveFromBasketResult>) -> Void)
    
    func getBasket(idUser: Int,
                   completionHandler: @escaping (DataResponse<GetBasketResult>) -> Void)
}
