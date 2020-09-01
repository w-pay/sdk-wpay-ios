import UIKit

public protocol VillageAdministrationApiRepository: Configurable {
	func checkHealth(completion: @escaping ApiCompletion<HealthCheck>)
}
