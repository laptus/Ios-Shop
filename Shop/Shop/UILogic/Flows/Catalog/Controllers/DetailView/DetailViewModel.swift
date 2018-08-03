class DetailViewModel {
    var service = GBShopServicesFactory.instance().makeCatalogRequestsFactory()
    
    func getGoodInfo(for id: Int, completionHandler: @escaping ((GetGoodResult?, ProjectErrors?) -> Void)) {
        service.good(goodId: id, completionHandler: {response in
            switch response.result{
            case .success(let goodInfo):
                completionHandler(goodInfo, nil)
            case .failure(_) :
                completionHandler(nil, ProjectErrors(type: ErrorTypes.wrongRequest))
            }
        })
    }
}
