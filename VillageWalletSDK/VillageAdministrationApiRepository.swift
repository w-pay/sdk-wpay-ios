import UIKit

public protocol VillageAdministrationApiRepository: Configurable {
	func checkHealth(completion: @escaping ApiResult<HealthCheck>)
}
