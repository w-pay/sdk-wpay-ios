import UIKit

public protocol VillageAdministrationApiRepository: Configurable {
	func checkHealth(callback: @escaping ApiResult<HealthCheck>)
}
