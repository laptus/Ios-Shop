import Foundation

protocol IServerRequestFactory {
    func makeAuthRequestFactory() -> AuthRequestFactory
    func makePersonalDataRequestFactory() -> PersonalDataRequestFactory
}
