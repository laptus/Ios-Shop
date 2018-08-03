import Foundation
import UIKit

class CatalogViewModel: NSObject, UITableViewDataSource, UITableViewDelegate {
    var goods: [GoodOnPageResult] = []
    var catalogService: CatalogRequestsFactory
    var onItemSelected: ((Int) -> Void)?
    
    override init() {
        catalogService = GBShopServicesFactory.instance().makeCatalogRequestsFactory()
        super.init()
    }
    
    func getGoods(completionHandler: @escaping((_ error: ProjectErrors?) -> Void)) {
        catalogService.goods(page: 1, categoryId: 1, completionHandler: {[weak self] result in
            var error: ProjectErrors?
            switch result.result {
            case .success(let data):
                self?.goods = []
                self?.goods.append(contentsOf: data)
            case .failure(_):
                error = ProjectErrors(type: ErrorTypes.wrongRequest)
            }
            DispatchQueue.main.async {
                completionHandler(error)
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goods.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let good = goods[indexPath.row]
        onItemSelected?(good.id)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let buyAction = UITableViewRowAction(style: UITableViewRowActionStyle.default,
                                             title: "Buy",
                                             handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
            let good = GetGoodResult(result: 1,
                name: self.goods[indexPath.row].name,
                price: self.goods[indexPath.row].price,
                description: "")
            Basket.add(good: good)
        })
        return [buyAction]
    }
}
