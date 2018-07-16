import Alamofire
import Foundation

protocol BasketRequestsFactory {
   
    func addToBasket(idProduct: Int,
                     quantity: Int,
                     completionHandler: @escaping (DataResponse<GetGoodResult>) -> Void)
    
    func deleteFromBasket(idProduct: Int,
                          completionHandler: @escaping (DataResponse<GetGoodResult>) -> Void)
    
    func getBasket(idUser: Int,
                   completionHandler: @escaping (DataResponse<GetGoodResult>) -> Void)
}
