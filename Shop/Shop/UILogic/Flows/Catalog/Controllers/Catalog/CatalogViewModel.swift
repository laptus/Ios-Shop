import Foundation
import UIKit

class CatalogViewModel: NSObject, UITableViewDataSource, UITableViewDelegate, Analytics {
    var goods: [GoodOnPageResult] = []
    var catalogService: CatalogRequestsFactory
    var onItemSelected: ((Int) -> Void)?
    
    override init() {
        catalogService = GBShopServicesFactory.instance().makeCatalogRequestsFactory()
        super.init()
    }
    
    func getGoods(completionHandler: @escaping((_ error: Errors?) -> Void)) {
        catalogService.goods(page: 1,
                             categoryId: 1,
                             completionHandler: {[weak self] result in
            var error: Errors?
            switch result.result {
            case .success(let data):
                self?.goods = []
                self?.goods.append(contentsOf: data)
                self?.track(AnalyticsEvent.catalog(moethod: .getCatalog,
                                                   success: true))
            case .failure:
                error = Errors(type: ErrorTypes.wrongRequest)
                self?.track(AnalyticsEvent.catalog(moethod: .getCatalog,
                                                   success: false))
            }
            DispatchQueue.main.async {
                completionHandler(error)
            }
        })
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return goods.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goodCell",
                                                       for: indexPath)
            as? GoodCell else {
                return UITableViewCell(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        }
        cell.price.text = String(goods[indexPath.row].price)
        cell.name.text = goods[indexPath.row].name
        cell.id.text = String(goods[indexPath.row].id)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        let good = goods[indexPath.row]
        onItemSelected?(good.id)
    }
    
    func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let buyAction = UITableViewRowAction(style: UITableViewRowActionStyle.default,
                                             title: "Buy",
                                             handler: {( _: UITableViewRowAction, indexPath: IndexPath) -> Void in
                                                let good = GetGoodResult(result: 1,
                                                                         name: self.goods[indexPath.row].name,
                                                                         price: self.goods[indexPath.row].price,
                                                                         description: "")
                                                Basket.add(good: good)
                                                self.track(AnalyticsEvent.basket(moethod: .add,
                                                                                 success: true))
        })
        return [buyAction]
    }
}
